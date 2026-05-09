; DESCRIPTION: Places a red line segment connecting (70, 225) to (8, 134).
; PLAN: r0=70(x1), r1=225(y1), r2=8(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 225
LDI r2, 8
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
