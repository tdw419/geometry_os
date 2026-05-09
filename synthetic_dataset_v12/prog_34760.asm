; DESCRIPTION: Draws a cyan rectangle at (20, 54) with width 63 and height 12.
; PLAN: r0=20(x), r1=54(y), r2=63(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 54
LDI r2, 63
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
