; DESCRIPTION: Renders a white line between points (144, 82) and (120, 123).
; PLAN: r0=144(x1), r1=82(y1), r2=120(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 82
LDI r2, 120
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
