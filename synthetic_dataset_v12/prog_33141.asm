; DESCRIPTION: Places a orange 119x119 rectangle at position (197, 43).
; PLAN: r0=197(x), r1=43(y), r2=119(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 43
LDI r2, 119
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
