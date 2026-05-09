; DESCRIPTION: Places a magenta line segment connecting (206, 144) to (206, 57).
; PLAN: r0=206(x1), r1=144(y1), r2=206(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 144
LDI r2, 206
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
