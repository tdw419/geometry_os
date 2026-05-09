; DESCRIPTION: Places a white line segment connecting (279, 30) to (113, 139).
; PLAN: r0=279(x1), r1=30(y1), r2=113(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 30
LDI r2, 113
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
