; DESCRIPTION: Places a magenta line segment connecting (122, 25) to (27, 233).
; PLAN: r0=122(x1), r1=25(y1), r2=27(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 25
LDI r2, 27
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
