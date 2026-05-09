; DESCRIPTION: Draws a black line from (245, 154) to (500, 243).
; PLAN: r0=245(x1), r1=154(y1), r2=500(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 154
LDI r2, 500
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
