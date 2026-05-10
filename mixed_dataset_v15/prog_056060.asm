; DESCRIPTION: Renders a green line segment connecting (3, 173) to (275, 196).
; PLAN: r0=3(x1), r1=173(y1), r2=275(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 173
LDI r2, 275
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
