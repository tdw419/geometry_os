; DESCRIPTION: Places a magenta line segment connecting (455, 172) to (342, 42).
; PLAN: r0=455(x1), r1=172(y1), r2=342(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 172
LDI r2, 342
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
