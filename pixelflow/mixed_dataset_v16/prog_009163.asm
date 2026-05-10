; DESCRIPTION: Draws a black line from (217, 48) to (84, 247).
; PLAN: r0=217(x1), r1=48(y1), r2=84(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 48
LDI r2, 84
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
