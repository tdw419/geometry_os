; DESCRIPTION: Places a cyan line segment connecting (218, 248) to (321, 116).
; PLAN: r0=218(x1), r1=248(y1), r2=321(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 248
LDI r2, 321
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
