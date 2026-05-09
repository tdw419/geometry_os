; DESCRIPTION: Places a black line segment connecting (79, 55) to (247, 107).
; PLAN: r0=79(x1), r1=55(y1), r2=247(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 55
LDI r2, 247
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
