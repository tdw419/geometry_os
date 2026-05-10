; DESCRIPTION: Places a red line segment connecting (145, 107) to (480, 192).
; PLAN: r0=145(x1), r1=107(y1), r2=480(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 107
LDI r2, 480
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
