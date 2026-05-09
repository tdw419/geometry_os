; DESCRIPTION: Places a yellow line segment connecting (168, 225) to (44, 255).
; PLAN: r0=168(x1), r1=225(y1), r2=44(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 225
LDI r2, 44
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
