; DESCRIPTION: Places a magenta line segment connecting (221, 50) to (165, 195).
; PLAN: r0=221(x1), r1=50(y1), r2=165(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 50
LDI r2, 165
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
