; DESCRIPTION: Draws a purple line from (239, 202) to (6, 139).
; PLAN: r0=239(x1), r1=202(y1), r2=6(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 202
LDI r2, 6
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
