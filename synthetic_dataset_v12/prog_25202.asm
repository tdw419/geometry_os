; DESCRIPTION: Places a blue line segment connecting (177, 27) to (59, 251).
; PLAN: r0=177(x1), r1=27(y1), r2=59(x2), r3=251(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 27
LDI r2, 59
LDI r3, 251
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
