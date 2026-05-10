; DESCRIPTION: Renders a red line between points (260, 120) and (167, 154).
; PLAN: r0=260(x1), r1=120(y1), r2=167(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 120
LDI r2, 167
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
