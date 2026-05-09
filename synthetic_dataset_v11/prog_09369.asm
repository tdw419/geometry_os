; DESCRIPTION: Draws a yellow rectangle at (160, 7) with width 44 and height 30.
; PLAN: r0=160(x), r1=7(y), r2=44(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 7
LDI r2, 44
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
