; DESCRIPTION: Places a black line segment connecting (186, 56) to (48, 50).
; PLAN: r0=186(x1), r1=56(y1), r2=48(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 56
LDI r2, 48
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
