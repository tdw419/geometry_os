; DESCRIPTION: Places a yellow line segment connecting (386, 150) to (52, 4).
; PLAN: r0=386(x1), r1=150(y1), r2=52(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 150
LDI r2, 52
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
