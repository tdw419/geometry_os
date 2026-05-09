; DESCRIPTION: Places a white line segment connecting (154, 182) to (27, 80).
; PLAN: r0=154(x1), r1=182(y1), r2=27(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 182
LDI r2, 27
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
