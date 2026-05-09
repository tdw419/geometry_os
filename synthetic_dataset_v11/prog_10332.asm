; DESCRIPTION: Places a magenta line segment connecting (157, 167) to (48, 55).
; PLAN: r0=157(x1), r1=167(y1), r2=48(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 167
LDI r2, 48
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
