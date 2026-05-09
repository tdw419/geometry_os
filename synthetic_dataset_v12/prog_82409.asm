; DESCRIPTION: Draws a cyan rectangle at (147, 149) with width 40 and height 93.
; PLAN: r0=147(x), r1=149(y), r2=40(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 149
LDI r2, 40
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
