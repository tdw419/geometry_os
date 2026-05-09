; DESCRIPTION: Places a cyan line segment connecting (137, 130) to (400, 17).
; PLAN: r0=137(x1), r1=130(y1), r2=400(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 130
LDI r2, 400
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
