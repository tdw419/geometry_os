; DESCRIPTION: Draws a purple line from (126, 179) to (380, 218).
; PLAN: r0=126(x1), r1=179(y1), r2=380(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 179
LDI r2, 380
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
