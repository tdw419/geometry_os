; DESCRIPTION: Renders a white line between points (113, 212) and (43, 148).
; PLAN: r0=113(x1), r1=212(y1), r2=43(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 212
LDI r2, 43
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
