; DESCRIPTION: Draws a purple line from (421, 165) to (394, 57).
; PLAN: r0=421(x1), r1=165(y1), r2=394(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 165
LDI r2, 394
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
