; DESCRIPTION: Places a magenta line segment connecting (456, 64) to (67, 91).
; PLAN: r0=456(x1), r1=64(y1), r2=67(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 64
LDI r2, 67
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
