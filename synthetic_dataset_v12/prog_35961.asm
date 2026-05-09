; DESCRIPTION: Places a black line segment connecting (143, 120) to (427, 113).
; PLAN: r0=143(x1), r1=120(y1), r2=427(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 120
LDI r2, 427
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
