; DESCRIPTION: Renders a cyan line between points (33, 161) and (432, 140).
; PLAN: r0=33(x1), r1=161(y1), r2=432(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 161
LDI r2, 432
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
