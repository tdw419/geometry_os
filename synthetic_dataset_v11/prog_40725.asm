; DESCRIPTION: Draws a purple line from (62, 126) to (154, 134).
; PLAN: r0=62(x1), r1=126(y1), r2=154(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 126
LDI r2, 154
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
