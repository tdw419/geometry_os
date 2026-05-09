; DESCRIPTION: Places a cyan line segment connecting (276, 44) to (245, 104).
; PLAN: r0=276(x1), r1=44(y1), r2=245(x2), r3=104(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 44
LDI r2, 245
LDI r3, 104
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
