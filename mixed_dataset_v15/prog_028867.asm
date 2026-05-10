; DESCRIPTION: Renders a white line between points (280, 109) and (469, 189).
; PLAN: r0=280(x1), r1=109(y1), r2=469(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 109
LDI r2, 469
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
