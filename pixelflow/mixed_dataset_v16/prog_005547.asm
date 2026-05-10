; DESCRIPTION: Places a magenta line segment connecting (226, 173) to (437, 94).
; PLAN: r0=226(x1), r1=173(y1), r2=437(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 173
LDI r2, 437
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
