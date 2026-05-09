; DESCRIPTION: Renders a red line between points (167, 154) and (228, 181).
; PLAN: r0=167(x1), r1=154(y1), r2=228(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 154
LDI r2, 228
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
