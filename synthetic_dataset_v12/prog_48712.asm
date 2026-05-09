; DESCRIPTION: Places a cyan line segment connecting (217, 116) to (508, 120).
; PLAN: r0=217(x1), r1=116(y1), r2=508(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 116
LDI r2, 508
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
