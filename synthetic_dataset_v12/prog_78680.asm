; DESCRIPTION: Draws a black line from (350, 234) to (243, 175).
; PLAN: r0=350(x1), r1=234(y1), r2=243(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 234
LDI r2, 243
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
