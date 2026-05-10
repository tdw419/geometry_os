; DESCRIPTION: Renders a purple line between points (289, 128) and (405, 240).
; PLAN: r0=289(x1), r1=128(y1), r2=405(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 128
LDI r2, 405
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
