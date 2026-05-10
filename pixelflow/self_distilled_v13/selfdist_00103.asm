; DESCRIPTION: Renders a purple line segment connecting (271, 42) to (103, 28).
; PLAN: r0=271(x1), r1=42(y1), r2=103(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 42
LDI r2, 103
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
