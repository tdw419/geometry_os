; DESCRIPTION: Places a cyan line segment connecting (92, 116) to (74, 179).
; PLAN: r0=92(x1), r1=116(y1), r2=74(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 116
LDI r2, 74
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
