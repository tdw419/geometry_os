; DESCRIPTION: Places a purple line segment connecting (50, 76) to (487, 248).
; PLAN: r0=50(x1), r1=76(y1), r2=487(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 76
LDI r2, 487
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
