; DESCRIPTION: Places a cyan line segment connecting (68, 233) to (11, 144).
; PLAN: r0=68(x1), r1=233(y1), r2=11(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 233
LDI r2, 11
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
