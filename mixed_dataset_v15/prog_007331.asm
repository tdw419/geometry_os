; DESCRIPTION: Places a magenta line segment connecting (360, 247) to (450, 138).
; PLAN: r0=360(x1), r1=247(y1), r2=450(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 247
LDI r2, 450
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
