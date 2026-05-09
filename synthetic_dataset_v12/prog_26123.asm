; DESCRIPTION: Renders a white line between points (321, 80) and (122, 42).
; PLAN: r0=321(x1), r1=80(y1), r2=122(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 80
LDI r2, 122
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
