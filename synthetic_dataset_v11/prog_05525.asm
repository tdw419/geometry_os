; DESCRIPTION: Places a magenta line segment connecting (42, 120) to (182, 188).
; PLAN: r0=42(x1), r1=120(y1), r2=182(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 120
LDI r2, 182
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
