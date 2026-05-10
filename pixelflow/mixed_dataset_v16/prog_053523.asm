; DESCRIPTION: Places a magenta line segment connecting (436, 228) to (105, 223).
; PLAN: r0=436(x1), r1=228(y1), r2=105(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 228
LDI r2, 105
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
