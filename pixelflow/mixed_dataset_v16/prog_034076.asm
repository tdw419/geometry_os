; DESCRIPTION: Renders a orange line between points (373, 46) and (354, 169).
; PLAN: r0=373(x1), r1=46(y1), r2=354(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 46
LDI r2, 354
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
