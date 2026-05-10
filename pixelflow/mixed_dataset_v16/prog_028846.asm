; DESCRIPTION: Draws a purple line from (71, 173) to (35, 103).
; PLAN: r0=71(x1), r1=173(y1), r2=35(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 173
LDI r2, 35
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
