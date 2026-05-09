; DESCRIPTION: Renders a blue line between points (187, 83) and (107, 82).
; PLAN: r0=187(x1), r1=83(y1), r2=107(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 83
LDI r2, 107
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
