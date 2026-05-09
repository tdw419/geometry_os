; DESCRIPTION: Draws a purple line from (116, 231) to (45, 59).
; PLAN: r0=116(x1), r1=231(y1), r2=45(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 231
LDI r2, 45
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
