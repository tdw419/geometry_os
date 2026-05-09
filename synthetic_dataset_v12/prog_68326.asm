; DESCRIPTION: Renders a white line between points (364, 48) and (50, 229).
; PLAN: r0=364(x1), r1=48(y1), r2=50(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 48
LDI r2, 50
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
