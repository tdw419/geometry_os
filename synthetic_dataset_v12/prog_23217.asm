; DESCRIPTION: Renders a white line between points (373, 2) and (392, 156).
; PLAN: r0=373(x1), r1=2(y1), r2=392(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 2
LDI r2, 392
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
