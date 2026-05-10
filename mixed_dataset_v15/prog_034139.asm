; DESCRIPTION: Draws a purple line from (394, 192) to (228, 253).
; PLAN: r0=394(x1), r1=192(y1), r2=228(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 192
LDI r2, 228
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
