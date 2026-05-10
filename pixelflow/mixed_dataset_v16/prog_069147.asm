; DESCRIPTION: Places a green line segment connecting (71, 29) to (374, 135).
; PLAN: r0=71(x1), r1=29(y1), r2=374(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 29
LDI r2, 374
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
