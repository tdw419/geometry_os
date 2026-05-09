; DESCRIPTION: Places a magenta line segment connecting (382, 245) to (213, 131).
; PLAN: r0=382(x1), r1=245(y1), r2=213(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 245
LDI r2, 213
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
