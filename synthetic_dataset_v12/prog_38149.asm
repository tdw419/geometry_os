; DESCRIPTION: Renders a red line between points (405, 116) and (378, 192).
; PLAN: r0=405(x1), r1=116(y1), r2=378(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 116
LDI r2, 378
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
