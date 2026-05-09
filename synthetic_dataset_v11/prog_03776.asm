; DESCRIPTION: Renders a cyan line between points (138, 91) and (216, 189).
; PLAN: r0=138(x1), r1=91(y1), r2=216(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 91
LDI r2, 216
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
