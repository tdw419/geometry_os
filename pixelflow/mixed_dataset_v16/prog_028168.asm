; DESCRIPTION: Places a magenta line segment connecting (154, 44) to (47, 103).
; PLAN: r0=154(x1), r1=44(y1), r2=47(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 44
LDI r2, 47
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
