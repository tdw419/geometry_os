; DESCRIPTION: Places a green line segment connecting (434, 28) to (237, 255).
; PLAN: r0=434(x1), r1=28(y1), r2=237(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 28
LDI r2, 237
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
