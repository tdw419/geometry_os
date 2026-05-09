; DESCRIPTION: Places a cyan line segment connecting (182, 30) to (308, 169).
; PLAN: r0=182(x1), r1=30(y1), r2=308(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 30
LDI r2, 308
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
