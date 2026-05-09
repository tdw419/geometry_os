; DESCRIPTION: Places a black line segment connecting (184, 107) to (223, 5).
; PLAN: r0=184(x1), r1=107(y1), r2=223(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 107
LDI r2, 223
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
