; DESCRIPTION: Places a red line segment connecting (460, 32) to (495, 85).
; PLAN: r0=460(x1), r1=32(y1), r2=495(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 32
LDI r2, 495
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
