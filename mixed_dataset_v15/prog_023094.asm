; DESCRIPTION: Renders a cyan line segment connecting (214, 88) to (115, 60).
; PLAN: r0=214(x1), r1=88(y1), r2=115(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 88
LDI r2, 115
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
