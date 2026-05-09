; DESCRIPTION: Draws a cyan rectangle at (47, 130) with width 109 and height 55.
; PLAN: r0=47(x), r1=130(y), r2=109(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 130
LDI r2, 109
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
