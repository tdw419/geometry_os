; DESCRIPTION: Draws a black line from (338, 99) to (293, 150).
; PLAN: r0=338(x1), r1=99(y1), r2=293(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 99
LDI r2, 293
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
