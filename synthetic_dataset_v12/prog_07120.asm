; DESCRIPTION: Renders a green line between points (113, 84) and (501, 224).
; PLAN: r0=113(x1), r1=84(y1), r2=501(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 84
LDI r2, 501
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
