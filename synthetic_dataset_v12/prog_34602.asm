; DESCRIPTION: Places a red line segment connecting (5, 206) to (45, 138).
; PLAN: r0=5(x1), r1=206(y1), r2=45(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 206
LDI r2, 45
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
