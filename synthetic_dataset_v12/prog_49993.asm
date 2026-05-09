; DESCRIPTION: Places a magenta line segment connecting (425, 153) to (283, 139).
; PLAN: r0=425(x1), r1=153(y1), r2=283(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 153
LDI r2, 283
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
