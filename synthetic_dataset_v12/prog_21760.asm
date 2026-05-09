; DESCRIPTION: Draws a purple line from (294, 186) to (231, 115).
; PLAN: r0=294(x1), r1=186(y1), r2=231(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 186
LDI r2, 231
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
