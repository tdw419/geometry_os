; DESCRIPTION: Places a purple line segment connecting (394, 81) to (346, 248).
; PLAN: r0=394(x1), r1=81(y1), r2=346(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 81
LDI r2, 346
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
