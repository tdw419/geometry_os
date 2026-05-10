; DESCRIPTION: Draws a cyan rectangle at (399, 130) with width 59 and height 37.
; PLAN: r0=399(x), r1=130(y), r2=59(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 130
LDI r2, 59
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
