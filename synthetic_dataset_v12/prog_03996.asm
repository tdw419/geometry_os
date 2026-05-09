; DESCRIPTION: Places a black line segment connecting (143, 189) to (265, 50).
; PLAN: r0=143(x1), r1=189(y1), r2=265(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 189
LDI r2, 265
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
