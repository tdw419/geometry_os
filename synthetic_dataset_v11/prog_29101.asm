; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (145, 23) with width 29 and height 36. Then Renders a green line between points (77, 114) and (98, 255).
; PLAN: r0=145(x), r1=23(y), r2=29(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=77(x1), r1=114(y1), r2=98(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan rectangle at (145, 23) with width 29 and height 36.
; PLAN: r0=145(x), r1=23(y), r2=29(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 23
LDI r2, 29
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green line between points (77, 114) and (98, 255).
; PLAN: r0=77(x1), r1=114(y1), r2=98(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 114
LDI r2, 98
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
