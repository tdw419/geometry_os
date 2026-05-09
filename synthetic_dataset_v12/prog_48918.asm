; DESCRIPTION: Places a yellow line segment connecting (323, 195) to (401, 13).
; PLAN: r0=323(x1), r1=195(y1), r2=401(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 195
LDI r2, 401
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
