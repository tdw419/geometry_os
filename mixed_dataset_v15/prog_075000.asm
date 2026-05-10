; DESCRIPTION: Places a green line segment connecting (213, 175) to (136, 50).
; PLAN: r0=213(x1), r1=175(y1), r2=136(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 175
LDI r2, 136
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
