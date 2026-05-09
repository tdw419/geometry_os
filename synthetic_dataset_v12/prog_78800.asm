; DESCRIPTION: Draws a purple line from (82, 199) to (416, 154).
; PLAN: r0=82(x1), r1=199(y1), r2=416(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 199
LDI r2, 416
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
