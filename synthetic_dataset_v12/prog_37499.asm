; DESCRIPTION: Places a magenta line segment connecting (10, 82) to (177, 239).
; PLAN: r0=10(x1), r1=82(y1), r2=177(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 82
LDI r2, 177
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
