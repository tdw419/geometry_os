; DESCRIPTION: Places a purple line segment connecting (218, 31) to (82, 68).
; PLAN: r0=218(x1), r1=31(y1), r2=82(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 31
LDI r2, 82
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
