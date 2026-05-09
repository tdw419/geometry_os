; DESCRIPTION: Renders a red line between points (228, 46) and (175, 154).
; PLAN: r0=228(x1), r1=46(y1), r2=175(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 46
LDI r2, 175
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
