; DESCRIPTION: Renders a cyan line segment connecting (368, 184) to (207, 185).
; PLAN: r0=368(x1), r1=184(y1), r2=207(x2), r3=185(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 184
LDI r2, 207
LDI r3, 185
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
