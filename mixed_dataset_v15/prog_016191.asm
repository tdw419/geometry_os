; DESCRIPTION: Renders a cyan line segment connecting (347, 176) to (400, 116).
; PLAN: r0=347(x1), r1=176(y1), r2=400(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 176
LDI r2, 400
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
