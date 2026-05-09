; DESCRIPTION: Places a red line segment connecting (472, 195) to (294, 250).
; PLAN: r0=472(x1), r1=195(y1), r2=294(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 195
LDI r2, 294
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
