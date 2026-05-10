; DESCRIPTION: Draws a purple line from (370, 46) to (228, 45).
; PLAN: r0=370(x1), r1=46(y1), r2=228(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 46
LDI r2, 228
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
