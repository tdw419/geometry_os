; DESCRIPTION: Draws a purple line from (240, 21) to (274, 215).
; PLAN: r0=240(x1), r1=21(y1), r2=274(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 21
LDI r2, 274
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
