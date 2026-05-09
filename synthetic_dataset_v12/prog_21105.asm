; DESCRIPTION: Places a magenta line segment connecting (153, 117) to (210, 167).
; PLAN: r0=153(x1), r1=117(y1), r2=210(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 117
LDI r2, 210
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
