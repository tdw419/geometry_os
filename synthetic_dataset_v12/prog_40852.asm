; DESCRIPTION: Places a cyan line segment connecting (427, 12) to (341, 134).
; PLAN: r0=427(x1), r1=12(y1), r2=341(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 12
LDI r2, 341
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
