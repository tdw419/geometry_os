; DESCRIPTION: Draws a black line from (214, 65) to (217, 175).
; PLAN: r0=214(x1), r1=65(y1), r2=217(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 65
LDI r2, 217
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
