; DESCRIPTION: Renders a green line between points (237, 88) and (255, 13).
; PLAN: r0=237(x1), r1=88(y1), r2=255(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 88
LDI r2, 255
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
