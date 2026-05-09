; DESCRIPTION: Places a red line segment connecting (48, 144) to (294, 233).
; PLAN: r0=48(x1), r1=144(y1), r2=294(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 144
LDI r2, 294
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
