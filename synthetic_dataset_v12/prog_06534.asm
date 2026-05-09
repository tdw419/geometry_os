; DESCRIPTION: Places a yellow line segment connecting (414, 126) to (470, 212).
; PLAN: r0=414(x1), r1=126(y1), r2=470(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 126
LDI r2, 470
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
