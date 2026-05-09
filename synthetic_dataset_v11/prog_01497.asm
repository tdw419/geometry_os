; DESCRIPTION: Composite: . Then Draws a cyan line from (222, 208) to (176, 229). Then Renders a blue box of size 60x51 starting at (9, 94).
; PLAN: r0=222(x1), r1=208(y1), r2=176(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=9(x), r1=94(y), r2=60(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (222, 208) to (176, 229).
; PLAN: r0=222(x1), r1=208(y1), r2=176(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 208
LDI r2, 176
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 60x51 starting at (9, 94).
; PLAN: r0=9(x), r1=94(y), r2=60(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 94
LDI r2, 60
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
