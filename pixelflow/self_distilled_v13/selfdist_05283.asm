; DESCRIPTION: Renders a white line segment connecting (48, 173) to (62, 15).
; PLAN: r0=48(x1), r1=173(y1), r2=62(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 173
LDI r2, 62
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
