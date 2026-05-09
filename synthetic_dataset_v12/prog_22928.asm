; DESCRIPTION: Draws a purple line from (195, 82) to (103, 178).
; PLAN: r0=195(x1), r1=82(y1), r2=103(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 82
LDI r2, 103
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
