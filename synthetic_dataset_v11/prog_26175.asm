; DESCRIPTION: Renders a green line between points (172, 163) and (205, 50).
; PLAN: r0=172(x1), r1=163(y1), r2=205(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 163
LDI r2, 205
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
