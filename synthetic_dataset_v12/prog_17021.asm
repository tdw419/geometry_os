; DESCRIPTION: Renders a yellow line between points (86, 154) and (199, 120).
; PLAN: r0=86(x1), r1=154(y1), r2=199(x2), r3=120(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 154
LDI r2, 199
LDI r3, 120
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
