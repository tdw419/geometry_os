; DESCRIPTION: Places a red line segment connecting (482, 32) to (509, 48).
; PLAN: r0=482(x1), r1=32(y1), r2=509(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 32
LDI r2, 509
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
