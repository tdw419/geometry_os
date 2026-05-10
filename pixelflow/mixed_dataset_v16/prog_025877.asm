; DESCRIPTION: Renders a white line between points (44, 230) and (205, 154).
; PLAN: r0=44(x1), r1=230(y1), r2=205(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 230
LDI r2, 205
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
