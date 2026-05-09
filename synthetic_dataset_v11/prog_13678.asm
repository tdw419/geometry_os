; DESCRIPTION: Places a cyan line segment connecting (100, 85) to (79, 199).
; PLAN: r0=100(x1), r1=85(y1), r2=79(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 85
LDI r2, 79
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
