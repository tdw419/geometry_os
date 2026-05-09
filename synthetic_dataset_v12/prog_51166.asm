; DESCRIPTION: Places a red line segment connecting (48, 60) to (274, 202).
; PLAN: r0=48(x1), r1=60(y1), r2=274(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 60
LDI r2, 274
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
