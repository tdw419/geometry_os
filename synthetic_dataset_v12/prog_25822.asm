; DESCRIPTION: Renders a cyan line between points (6, 194) and (169, 109).
; PLAN: r0=6(x1), r1=194(y1), r2=169(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 194
LDI r2, 169
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
