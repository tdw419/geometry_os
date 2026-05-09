; DESCRIPTION: Places a magenta line segment connecting (61, 159) to (32, 186).
; PLAN: r0=61(x1), r1=159(y1), r2=32(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 159
LDI r2, 32
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
