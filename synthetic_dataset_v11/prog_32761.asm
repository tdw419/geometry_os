; DESCRIPTION: Places a cyan line segment connecting (100, 124) to (129, 143).
; PLAN: r0=100(x1), r1=124(y1), r2=129(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 124
LDI r2, 129
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
