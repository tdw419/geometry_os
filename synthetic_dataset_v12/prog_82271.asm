; DESCRIPTION: Places a cyan line segment connecting (341, 172) to (367, 53).
; PLAN: r0=341(x1), r1=172(y1), r2=367(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 172
LDI r2, 367
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
