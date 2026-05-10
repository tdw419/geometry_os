; DESCRIPTION: Renders a cyan line segment connecting (14, 33) to (328, 10).
; PLAN: r0=14(x1), r1=33(y1), r2=328(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 33
LDI r2, 328
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
