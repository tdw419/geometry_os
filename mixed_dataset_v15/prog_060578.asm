; DESCRIPTION: Places a green line segment connecting (233, 5) to (260, 182).
; PLAN: r0=233(x1), r1=5(y1), r2=260(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 5
LDI r2, 260
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
