; DESCRIPTION: Places a magenta line segment connecting (243, 74) to (33, 59).
; PLAN: r0=243(x1), r1=74(y1), r2=33(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 74
LDI r2, 33
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
