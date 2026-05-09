; DESCRIPTION: Renders a white line between points (474, 176) and (405, 112).
; PLAN: r0=474(x1), r1=176(y1), r2=405(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 176
LDI r2, 405
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
