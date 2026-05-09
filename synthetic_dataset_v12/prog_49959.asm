; DESCRIPTION: Places a cyan line segment connecting (7, 79) to (246, 72).
; PLAN: r0=7(x1), r1=79(y1), r2=246(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 79
LDI r2, 246
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
