; DESCRIPTION: Places a cyan line segment connecting (77, 76) to (246, 43).
; PLAN: r0=77(x1), r1=76(y1), r2=246(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 76
LDI r2, 246
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
