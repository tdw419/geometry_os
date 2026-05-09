; DESCRIPTION: Draws a purple line from (82, 133) to (154, 226).
; PLAN: r0=82(x1), r1=133(y1), r2=154(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 133
LDI r2, 154
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
