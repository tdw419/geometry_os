; DESCRIPTION: Draws a yellow rectangle at (235, 130) with width 86 and height 52.
; PLAN: r0=235(x), r1=130(y), r2=86(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 130
LDI r2, 86
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
