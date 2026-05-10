; DESCRIPTION: Renders a cyan line segment connecting (23, 2) to (109, 20).
; PLAN: r0=23(x1), r1=2(y1), r2=109(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 2
LDI r2, 109
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
