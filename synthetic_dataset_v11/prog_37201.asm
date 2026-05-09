; DESCRIPTION: Renders a cyan line between points (97, 45) and (169, 33).
; PLAN: r0=97(x1), r1=45(y1), r2=169(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 45
LDI r2, 169
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
