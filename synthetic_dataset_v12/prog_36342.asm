; DESCRIPTION: Places a magenta line segment connecting (410, 150) to (73, 196).
; PLAN: r0=410(x1), r1=150(y1), r2=73(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 150
LDI r2, 73
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
