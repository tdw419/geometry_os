; DESCRIPTION: Places a cyan line segment connecting (289, 116) to (269, 95).
; PLAN: r0=289(x1), r1=116(y1), r2=269(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 116
LDI r2, 269
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
