; DESCRIPTION: Places a red line segment connecting (103, 100) to (433, 242).
; PLAN: r0=103(x1), r1=100(y1), r2=433(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 100
LDI r2, 433
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
