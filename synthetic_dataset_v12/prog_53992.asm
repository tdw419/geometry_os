; DESCRIPTION: Places a magenta line segment connecting (303, 253) to (464, 93).
; PLAN: r0=303(x1), r1=253(y1), r2=464(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 253
LDI r2, 464
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
