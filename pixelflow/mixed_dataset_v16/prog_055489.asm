; DESCRIPTION: Renders a green line between points (374, 76) and (48, 152).
; PLAN: r0=374(x1), r1=76(y1), r2=48(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 76
LDI r2, 48
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
