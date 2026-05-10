; DESCRIPTION: Draws a cyan rectangle at (1, 130) with width 106 and height 55.
; PLAN: r0=1(x), r1=130(y), r2=106(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 130
LDI r2, 106
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
