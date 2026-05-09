; DESCRIPTION: Places a cyan line segment connecting (453, 182) to (244, 117).
; PLAN: r0=453(x1), r1=182(y1), r2=244(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 182
LDI r2, 244
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
