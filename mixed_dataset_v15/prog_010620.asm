; DESCRIPTION: Draws a cyan rectangle at (9, 130) with width 120 and height 35.
; PLAN: r0=9(x), r1=130(y), r2=120(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 130
LDI r2, 120
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
