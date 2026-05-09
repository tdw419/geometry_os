; DESCRIPTION: Draws a cyan line from (140, 112) to (216, 227).
; PLAN: r0=140(x1), r1=112(y1), r2=216(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 112
LDI r2, 216
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
