; DESCRIPTION: Draws a black line from (330, 175) to (396, 75).
; PLAN: r0=330(x1), r1=175(y1), r2=396(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 175
LDI r2, 396
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
