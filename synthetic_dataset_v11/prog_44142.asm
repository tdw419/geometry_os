; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (188, 147) to (230, 167). Then Renders a blue box of size 53x54 starting at (176, 93).
; PLAN: r0=188(x1), r1=147(y1), r2=230(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=176(x), r1=93(y), r2=53(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (188, 147) to (230, 167).
; PLAN: r0=188(x1), r1=147(y1), r2=230(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 147
LDI r2, 230
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 53x54 starting at (176, 93).
; PLAN: r0=176(x), r1=93(y), r2=53(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 93
LDI r2, 53
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
