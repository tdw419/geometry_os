; DESCRIPTION: Places a yellow line segment connecting (218, 210) to (468, 199).
; PLAN: r0=218(x1), r1=210(y1), r2=468(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 210
LDI r2, 468
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
