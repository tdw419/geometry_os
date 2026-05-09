; DESCRIPTION: Draws a purple line from (71, 32) to (50, 103).
; PLAN: r0=71(x1), r1=32(y1), r2=50(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 32
LDI r2, 50
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
