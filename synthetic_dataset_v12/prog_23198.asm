; DESCRIPTION: Renders a purple line between points (434, 4) and (405, 170).
; PLAN: r0=434(x1), r1=4(y1), r2=405(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 4
LDI r2, 405
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
