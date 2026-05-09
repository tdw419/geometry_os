; DESCRIPTION: Draws a purple line from (231, 139) to (208, 215).
; PLAN: r0=231(x1), r1=139(y1), r2=208(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 139
LDI r2, 208
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
