; DESCRIPTION: Places a cyan line segment connecting (503, 18) to (349, 247).
; PLAN: r0=503(x1), r1=18(y1), r2=349(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 18
LDI r2, 349
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
