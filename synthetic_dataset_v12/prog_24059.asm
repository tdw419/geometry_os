; DESCRIPTION: Places a red line segment connecting (120, 82) to (386, 84).
; PLAN: r0=120(x1), r1=82(y1), r2=386(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 82
LDI r2, 386
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
