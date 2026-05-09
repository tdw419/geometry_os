; DESCRIPTION: Draws a magenta line from (252, 216) to (242, 137).
; PLAN: r0=252(x1), r1=216(y1), r2=242(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 216
LDI r2, 242
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
