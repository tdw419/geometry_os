; DESCRIPTION: Places a white line segment connecting (136, 197) to (245, 84).
; PLAN: r0=136(x1), r1=197(y1), r2=245(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 197
LDI r2, 245
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
