; DESCRIPTION: Draws a purple line from (86, 245) to (509, 38).
; PLAN: r0=86(x1), r1=245(y1), r2=509(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 245
LDI r2, 509
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
