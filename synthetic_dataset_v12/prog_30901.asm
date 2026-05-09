; DESCRIPTION: Places a magenta line segment connecting (243, 24) to (268, 244).
; PLAN: r0=243(x1), r1=24(y1), r2=268(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 24
LDI r2, 268
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
