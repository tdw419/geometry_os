; DESCRIPTION: Places a purple line segment connecting (233, 206) to (294, 255).
; PLAN: r0=233(x1), r1=206(y1), r2=294(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 206
LDI r2, 294
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
