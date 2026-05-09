; DESCRIPTION: Draws a red line from (373, 205) to (340, 169).
; PLAN: r0=373(x1), r1=205(y1), r2=340(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 205
LDI r2, 340
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
