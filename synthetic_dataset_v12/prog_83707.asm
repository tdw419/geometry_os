; DESCRIPTION: Places a orange 18x58 rectangle at position (197, 80).
; PLAN: r0=197(x), r1=80(y), r2=18(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 80
LDI r2, 18
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
