; DESCRIPTION: Draws a cyan rectangle at (147, 20) with width 86 and height 111.
; PLAN: r0=147(x), r1=20(y), r2=86(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 20
LDI r2, 86
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
