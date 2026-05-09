; DESCRIPTION: Places a red line segment connecting (207, 38) to (125, 38).
; PLAN: r0=207(x1), r1=38(y1), r2=125(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 38
LDI r2, 125
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
