; DESCRIPTION: Places a green line segment connecting (414, 233) to (260, 173).
; PLAN: r0=414(x1), r1=233(y1), r2=260(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 233
LDI r2, 260
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
