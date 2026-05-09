; DESCRIPTION: Renders a green line between points (215, 232) and (14, 224).
; PLAN: r0=215(x1), r1=232(y1), r2=14(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 232
LDI r2, 14
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
