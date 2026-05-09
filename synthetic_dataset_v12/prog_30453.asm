; DESCRIPTION: Places a magenta line segment connecting (425, 8) to (305, 5).
; PLAN: r0=425(x1), r1=8(y1), r2=305(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 8
LDI r2, 305
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
