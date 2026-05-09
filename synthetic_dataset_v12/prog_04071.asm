; DESCRIPTION: Renders a green line between points (187, 226) and (106, 76).
; PLAN: r0=187(x1), r1=226(y1), r2=106(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 226
LDI r2, 106
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
