; DESCRIPTION: Draws a purple line from (481, 124) to (246, 236).
; PLAN: r0=481(x1), r1=124(y1), r2=246(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 124
LDI r2, 246
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
