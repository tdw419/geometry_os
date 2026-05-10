; DESCRIPTION: Renders a green line segment connecting (104, 39) to (56, 173).
; PLAN: r0=104(x1), r1=39(y1), r2=56(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 39
LDI r2, 56
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
