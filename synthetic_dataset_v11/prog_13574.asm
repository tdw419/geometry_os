; DESCRIPTION: Places a red line segment connecting (0, 164) to (48, 250).
; PLAN: r0=0(x1), r1=164(y1), r2=48(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 164
LDI r2, 48
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
