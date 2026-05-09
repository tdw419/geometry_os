; DESCRIPTION: Draws a black line from (217, 160) to (206, 250).
; PLAN: r0=217(x1), r1=160(y1), r2=206(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 160
LDI r2, 206
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
