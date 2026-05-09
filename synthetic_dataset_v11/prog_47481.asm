; DESCRIPTION: Places a yellow line segment connecting (240, 103) to (37, 177).
; PLAN: r0=240(x1), r1=103(y1), r2=37(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 103
LDI r2, 37
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
