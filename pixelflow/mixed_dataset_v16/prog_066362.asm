; DESCRIPTION: Places a magenta line segment connecting (234, 248) to (307, 243).
; PLAN: r0=234(x1), r1=248(y1), r2=307(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 248
LDI r2, 307
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
