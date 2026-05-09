; DESCRIPTION: Places a red line segment connecting (209, 64) to (380, 224).
; PLAN: r0=209(x1), r1=64(y1), r2=380(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 64
LDI r2, 380
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
