; DESCRIPTION: Renders a green line segment connecting (13, 173) to (255, 56).
; PLAN: r0=13(x1), r1=173(y1), r2=255(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 173
LDI r2, 255
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
