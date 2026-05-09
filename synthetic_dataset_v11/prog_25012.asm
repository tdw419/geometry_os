; DESCRIPTION: Places a black line segment connecting (150, 172) to (115, 186).
; PLAN: r0=150(x1), r1=172(y1), r2=115(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 172
LDI r2, 115
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
