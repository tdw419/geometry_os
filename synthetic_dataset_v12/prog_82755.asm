; DESCRIPTION: Draws a black line from (234, 151) to (96, 175).
; PLAN: r0=234(x1), r1=151(y1), r2=96(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 151
LDI r2, 96
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
