; DESCRIPTION: Places a yellow line segment connecting (74, 37) to (48, 139).
; PLAN: r0=74(x1), r1=37(y1), r2=48(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 37
LDI r2, 48
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
