; DESCRIPTION: Renders a white line between points (280, 58) and (414, 241).
; PLAN: r0=280(x1), r1=58(y1), r2=414(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 58
LDI r2, 414
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
