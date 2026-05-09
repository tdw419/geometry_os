; DESCRIPTION: Places a magenta line segment connecting (206, 82) to (138, 220).
; PLAN: r0=206(x1), r1=82(y1), r2=138(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 82
LDI r2, 138
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
