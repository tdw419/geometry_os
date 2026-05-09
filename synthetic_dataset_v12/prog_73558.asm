; DESCRIPTION: Places a cyan line segment connecting (502, 106) to (20, 245).
; PLAN: r0=502(x1), r1=106(y1), r2=20(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 106
LDI r2, 20
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
