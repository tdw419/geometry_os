; DESCRIPTION: Draws a purple line from (98, 223) to (88, 228).
; PLAN: r0=98(x1), r1=223(y1), r2=88(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 223
LDI r2, 88
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
