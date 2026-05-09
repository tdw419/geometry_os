; DESCRIPTION: Draws a white line from (434, 19) to (225, 169).
; PLAN: r0=434(x1), r1=19(y1), r2=225(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 19
LDI r2, 225
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
