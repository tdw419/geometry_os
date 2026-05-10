; DESCRIPTION: Renders a purple line segment connecting (87, 146) to (127, 103).
; PLAN: r0=87(x1), r1=146(y1), r2=127(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 146
LDI r2, 127
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
