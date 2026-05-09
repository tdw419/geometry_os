; DESCRIPTION: Renders a yellow line between points (187, 95) and (85, 83).
; PLAN: r0=187(x1), r1=95(y1), r2=85(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 95
LDI r2, 85
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
