; DESCRIPTION: Places a yellow line segment connecting (208, 248) to (280, 240).
; PLAN: r0=208(x1), r1=248(y1), r2=280(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 248
LDI r2, 280
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
