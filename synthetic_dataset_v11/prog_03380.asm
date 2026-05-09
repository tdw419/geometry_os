; DESCRIPTION: Places a orange 33x43 rectangle at position (44, 24).
; PLAN: r0=44(x), r1=24(y), r2=33(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 24
LDI r2, 33
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
