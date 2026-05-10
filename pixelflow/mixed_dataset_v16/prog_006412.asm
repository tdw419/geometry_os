; DESCRIPTION: Places a red line segment connecting (256, 150) to (85, 127).
; PLAN: r0=256(x1), r1=150(y1), r2=85(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 150
LDI r2, 85
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
