; DESCRIPTION: Places a magenta line segment connecting (268, 247) to (436, 94).
; PLAN: r0=268(x1), r1=247(y1), r2=436(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 247
LDI r2, 436
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
