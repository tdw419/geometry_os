; DESCRIPTION: Draws a black line from (266, 171) to (190, 243).
; PLAN: r0=266(x1), r1=171(y1), r2=190(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 171
LDI r2, 190
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
