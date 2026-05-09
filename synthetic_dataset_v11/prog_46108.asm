; DESCRIPTION: Draws a orange line from (90, 234) to (242, 169).
; PLAN: r0=90(x1), r1=234(y1), r2=242(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 234
LDI r2, 242
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
