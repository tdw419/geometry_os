; DESCRIPTION: Places a magenta line segment connecting (241, 132) to (42, 193).
; PLAN: r0=241(x1), r1=132(y1), r2=42(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 132
LDI r2, 42
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
