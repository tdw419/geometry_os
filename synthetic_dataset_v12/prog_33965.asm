; DESCRIPTION: Renders a white line between points (320, 87) and (376, 181).
; PLAN: r0=320(x1), r1=87(y1), r2=376(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 87
LDI r2, 376
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
