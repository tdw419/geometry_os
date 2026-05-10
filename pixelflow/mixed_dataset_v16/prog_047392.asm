; DESCRIPTION: Renders a cyan line between points (303, 75) and (252, 154).
; PLAN: r0=303(x1), r1=75(y1), r2=252(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 75
LDI r2, 252
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
