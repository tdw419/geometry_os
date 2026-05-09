; DESCRIPTION: Renders a green line between points (447, 36) and (393, 224).
; PLAN: r0=447(x1), r1=36(y1), r2=393(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 36
LDI r2, 393
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
