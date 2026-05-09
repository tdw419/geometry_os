; DESCRIPTION: Places a red line segment connecting (39, 45) to (450, 49).
; PLAN: r0=39(x1), r1=45(y1), r2=450(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 45
LDI r2, 450
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
