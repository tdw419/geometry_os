; DESCRIPTION: Draws a green line from (307, 216) to (43, 230).
; PLAN: r0=307(x1), r1=216(y1), r2=43(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 216
LDI r2, 43
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
