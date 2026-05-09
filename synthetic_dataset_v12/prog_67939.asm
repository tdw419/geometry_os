; DESCRIPTION: Places a purple line segment connecting (246, 180) to (154, 120).
; PLAN: r0=246(x1), r1=180(y1), r2=154(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 180
LDI r2, 154
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
