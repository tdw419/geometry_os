; DESCRIPTION: Places a magenta line segment connecting (286, 245) to (503, 71).
; PLAN: r0=286(x1), r1=245(y1), r2=503(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 245
LDI r2, 503
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
