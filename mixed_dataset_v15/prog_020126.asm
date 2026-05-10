; DESCRIPTION: Renders a yellow line segment connecting (371, 27) to (277, 156).
; PLAN: r0=371(x1), r1=27(y1), r2=277(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 27
LDI r2, 277
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
