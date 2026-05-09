; DESCRIPTION: Renders a cyan line between points (447, 33) and (88, 218).
; PLAN: r0=447(x1), r1=33(y1), r2=88(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 33
LDI r2, 88
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
