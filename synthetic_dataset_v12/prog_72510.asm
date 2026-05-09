; DESCRIPTION: Places a magenta line segment connecting (186, 42) to (267, 46).
; PLAN: r0=186(x1), r1=42(y1), r2=267(x2), r3=46(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 42
LDI r2, 267
LDI r3, 46
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
