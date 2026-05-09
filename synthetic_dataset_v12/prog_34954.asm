; DESCRIPTION: Places a green line segment connecting (294, 199) to (3, 248).
; PLAN: r0=294(x1), r1=199(y1), r2=3(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 199
LDI r2, 3
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
