; DESCRIPTION: Places a black line segment connecting (42, 100) to (164, 120).
; PLAN: r0=42(x1), r1=100(y1), r2=164(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 100
LDI r2, 164
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
