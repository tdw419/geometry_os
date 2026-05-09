; DESCRIPTION: Places a cyan line segment connecting (439, 19) to (437, 10).
; PLAN: r0=439(x1), r1=19(y1), r2=437(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 19
LDI r2, 437
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
