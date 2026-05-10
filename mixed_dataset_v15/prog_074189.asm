; DESCRIPTION: Draws a purple line from (247, 205) to (48, 108).
; PLAN: r0=247(x1), r1=205(y1), r2=48(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 205
LDI r2, 48
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
