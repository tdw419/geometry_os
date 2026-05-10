; DESCRIPTION: Renders a orange line between points (333, 64) and (321, 235).
; PLAN: r0=333(x1), r1=64(y1), r2=321(x2), r3=235(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 64
LDI r2, 321
LDI r3, 235
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
