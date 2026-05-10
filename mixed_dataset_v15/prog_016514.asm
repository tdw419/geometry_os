; DESCRIPTION: Renders a purple line segment connecting (242, 27) to (180, 49).
; PLAN: r0=242(x1), r1=27(y1), r2=180(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 27
LDI r2, 180
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
