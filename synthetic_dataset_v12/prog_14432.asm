; DESCRIPTION: Draws a yellow rectangle at (143, 18) with width 80 and height 45.
; PLAN: r0=143(x), r1=18(y), r2=80(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 18
LDI r2, 80
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
