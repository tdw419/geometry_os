; DESCRIPTION: Places a cyan line segment connecting (351, 27) to (277, 116).
; PLAN: r0=351(x1), r1=27(y1), r2=277(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 27
LDI r2, 277
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
