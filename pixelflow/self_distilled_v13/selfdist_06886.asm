; DESCRIPTION: Renders a cyan line segment connecting (14, 162) to (68, 8).
; PLAN: r0=14(x1), r1=162(y1), r2=68(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 162
LDI r2, 68
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
