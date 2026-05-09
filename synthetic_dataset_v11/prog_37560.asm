; DESCRIPTION: Draws a white line from (204, 12) to (111, 169).
; PLAN: r0=204(x1), r1=12(y1), r2=111(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 12
LDI r2, 111
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
