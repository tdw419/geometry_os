; DESCRIPTION: Places a cyan line segment connecting (194, 116) to (58, 175).
; PLAN: r0=194(x1), r1=116(y1), r2=58(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 116
LDI r2, 58
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
