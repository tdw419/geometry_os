; DESCRIPTION: Places a red line segment connecting (256, 29) to (437, 221).
; PLAN: r0=256(x1), r1=29(y1), r2=437(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 29
LDI r2, 437
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
