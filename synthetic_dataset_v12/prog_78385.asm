; DESCRIPTION: Places a magenta line segment connecting (29, 153) to (69, 27).
; PLAN: r0=29(x1), r1=153(y1), r2=69(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 153
LDI r2, 69
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
