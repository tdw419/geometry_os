; DESCRIPTION: Draws a black rectangle at (87, 194) with width 11 and height 14.
; PLAN: r0=87(x), r1=194(y), r2=11(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 194
LDI r2, 11
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
