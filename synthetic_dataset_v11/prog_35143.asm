; DESCRIPTION: Renders a white line between points (26, 16) and (12, 99).
; PLAN: r0=26(x1), r1=16(y1), r2=12(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 16
LDI r2, 12
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
