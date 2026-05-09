; DESCRIPTION: Draws a purple line from (49, 243) to (228, 86).
; PLAN: r0=49(x1), r1=243(y1), r2=228(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 243
LDI r2, 228
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
