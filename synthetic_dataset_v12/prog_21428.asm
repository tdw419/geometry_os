; DESCRIPTION: Places a cyan line segment connecting (40, 246) to (364, 107).
; PLAN: r0=40(x1), r1=246(y1), r2=364(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 246
LDI r2, 364
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
