; DESCRIPTION: Renders a red line between points (405, 253) and (339, 49).
; PLAN: r0=405(x1), r1=253(y1), r2=339(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 253
LDI r2, 339
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
