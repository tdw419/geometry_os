; DESCRIPTION: Draws a black line from (394, 87) to (343, 40).
; PLAN: r0=394(x1), r1=87(y1), r2=343(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 87
LDI r2, 343
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
