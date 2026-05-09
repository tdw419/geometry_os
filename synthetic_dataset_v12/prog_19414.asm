; DESCRIPTION: Draws a cyan rectangle at (110, 130) with width 38 and height 93.
; PLAN: r0=110(x), r1=130(y), r2=38(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 130
LDI r2, 38
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
