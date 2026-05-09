; DESCRIPTION: Places a cyan line segment connecting (207, 96) to (194, 233).
; PLAN: r0=207(x1), r1=96(y1), r2=194(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 96
LDI r2, 194
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
