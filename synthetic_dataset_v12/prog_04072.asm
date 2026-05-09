; DESCRIPTION: Places a red line segment connecting (445, 172) to (109, 48).
; PLAN: r0=445(x1), r1=172(y1), r2=109(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 172
LDI r2, 109
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
