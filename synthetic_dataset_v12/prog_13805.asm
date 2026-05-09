; DESCRIPTION: Places a blue 18x81 rectangle at position (430, 26).
; PLAN: r0=430(x), r1=26(y), r2=18(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 26
LDI r2, 18
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
