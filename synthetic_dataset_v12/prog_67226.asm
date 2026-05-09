; DESCRIPTION: Renders a white line between points (43, 26) and (66, 167).
; PLAN: r0=43(x1), r1=26(y1), r2=66(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 26
LDI r2, 66
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
