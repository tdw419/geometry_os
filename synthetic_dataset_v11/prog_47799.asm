; DESCRIPTION: Draws a black line from (185, 85) to (32, 40).
; PLAN: r0=185(x1), r1=85(y1), r2=32(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 85
LDI r2, 32
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
