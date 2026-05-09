; DESCRIPTION: Places a magenta line segment connecting (502, 29) to (431, 95).
; PLAN: r0=502(x1), r1=29(y1), r2=431(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 29
LDI r2, 431
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
