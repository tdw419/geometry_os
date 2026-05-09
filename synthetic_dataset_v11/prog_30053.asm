; DESCRIPTION: Places a yellow line segment connecting (110, 181) to (120, 27).
; PLAN: r0=110(x1), r1=181(y1), r2=120(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 181
LDI r2, 120
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
