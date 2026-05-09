; DESCRIPTION: Draws a black line from (485, 223) to (321, 68).
; PLAN: r0=485(x1), r1=223(y1), r2=321(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 223
LDI r2, 321
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
