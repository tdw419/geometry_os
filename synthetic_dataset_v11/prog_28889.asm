; DESCRIPTION: Places a yellow line segment connecting (132, 3) to (173, 159).
; PLAN: r0=132(x1), r1=3(y1), r2=173(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 3
LDI r2, 173
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
