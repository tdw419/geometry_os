; DESCRIPTION: Renders a cyan line segment connecting (285, 109) to (149, 30).
; PLAN: r0=285(x1), r1=109(y1), r2=149(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 109
LDI r2, 149
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
