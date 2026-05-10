; DESCRIPTION: Places a magenta line segment connecting (354, 146) to (468, 207).
; PLAN: r0=354(x1), r1=146(y1), r2=468(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 146
LDI r2, 468
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
