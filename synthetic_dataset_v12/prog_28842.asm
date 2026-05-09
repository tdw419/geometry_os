; DESCRIPTION: Draws a purple line from (289, 188) to (66, 228).
; PLAN: r0=289(x1), r1=188(y1), r2=66(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 188
LDI r2, 66
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
