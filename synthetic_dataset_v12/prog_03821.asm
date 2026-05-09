; DESCRIPTION: Draws a black line from (60, 16) to (419, 175).
; PLAN: r0=60(x1), r1=16(y1), r2=419(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 16
LDI r2, 419
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
