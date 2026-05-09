; DESCRIPTION: Places a yellow line segment connecting (240, 16) to (207, 237).
; PLAN: r0=240(x1), r1=16(y1), r2=207(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 16
LDI r2, 207
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
