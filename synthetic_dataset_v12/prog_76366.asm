; DESCRIPTION: Places a yellow line segment connecting (420, 104) to (240, 177).
; PLAN: r0=420(x1), r1=104(y1), r2=240(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 104
LDI r2, 240
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
