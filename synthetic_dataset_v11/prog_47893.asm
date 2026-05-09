; DESCRIPTION: Places a red line segment connecting (48, 206) to (185, 4).
; PLAN: r0=48(x1), r1=206(y1), r2=185(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 206
LDI r2, 185
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
