; DESCRIPTION: Renders a black line between points (265, 154) and (154, 104).
; PLAN: r0=265(x1), r1=154(y1), r2=154(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 154
LDI r2, 154
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
