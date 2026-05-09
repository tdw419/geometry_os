; DESCRIPTION: Places a magenta line segment connecting (5, 146) to (326, 166).
; PLAN: r0=5(x1), r1=146(y1), r2=326(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 146
LDI r2, 326
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
