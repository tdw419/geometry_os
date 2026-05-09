; DESCRIPTION: Renders a yellow line between points (154, 8) and (342, 246).
; PLAN: r0=154(x1), r1=8(y1), r2=342(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 8
LDI r2, 342
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
