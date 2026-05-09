; DESCRIPTION: Places a red line segment connecting (224, 73) to (341, 132).
; PLAN: r0=224(x1), r1=73(y1), r2=341(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 73
LDI r2, 341
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
