; DESCRIPTION: Places a magenta line segment connecting (168, 12) to (174, 237).
; PLAN: r0=168(x1), r1=12(y1), r2=174(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 12
LDI r2, 174
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
