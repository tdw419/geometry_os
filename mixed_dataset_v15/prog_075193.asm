; DESCRIPTION: Places a magenta line segment connecting (69, 139) to (497, 253).
; PLAN: r0=69(x1), r1=139(y1), r2=497(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 139
LDI r2, 497
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
