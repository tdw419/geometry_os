; DESCRIPTION: Renders a yellow line between points (150, 83) and (98, 154).
; PLAN: r0=150(x1), r1=83(y1), r2=98(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 83
LDI r2, 98
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
