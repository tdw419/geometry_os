; DESCRIPTION: Renders a red line between points (66, 205) and (385, 153).
; PLAN: r0=66(x1), r1=205(y1), r2=385(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 205
LDI r2, 385
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
