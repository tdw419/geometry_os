; DESCRIPTION: Places a purple line segment connecting (481, 45) to (59, 192).
; PLAN: r0=481(x1), r1=45(y1), r2=59(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 45
LDI r2, 59
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
