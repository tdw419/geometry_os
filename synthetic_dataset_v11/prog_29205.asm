; DESCRIPTION: Draws a black line from (234, 24) to (59, 251).
; PLAN: r0=234(x1), r1=24(y1), r2=59(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 24
LDI r2, 59
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
