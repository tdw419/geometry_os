; DESCRIPTION: Draws a cyan rectangle at (23, 147) with width 93 and height 58.
; PLAN: r0=23(x), r1=147(y), r2=93(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 147
LDI r2, 93
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
