; DESCRIPTION: Places a yellow line segment connecting (216, 221) to (209, 229).
; PLAN: r0=216(x1), r1=221(y1), r2=209(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 221
LDI r2, 209
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
