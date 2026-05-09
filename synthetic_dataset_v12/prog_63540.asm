; DESCRIPTION: Draws a purple line from (304, 154) to (114, 226).
; PLAN: r0=304(x1), r1=154(y1), r2=114(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 154
LDI r2, 114
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
