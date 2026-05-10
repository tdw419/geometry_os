; DESCRIPTION: Places a magenta line segment connecting (468, 16) to (113, 192).
; PLAN: r0=468(x1), r1=16(y1), r2=113(x2), r3=192(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 16
LDI r2, 113
LDI r3, 192
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
