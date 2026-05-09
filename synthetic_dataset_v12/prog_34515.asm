; DESCRIPTION: Draws a black line from (371, 125) to (373, 60).
; PLAN: r0=371(x1), r1=125(y1), r2=373(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 125
LDI r2, 373
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
