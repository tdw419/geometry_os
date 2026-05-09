; DESCRIPTION: Places a cyan line segment connecting (189, 233) to (280, 31).
; PLAN: r0=189(x1), r1=233(y1), r2=280(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 233
LDI r2, 280
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
