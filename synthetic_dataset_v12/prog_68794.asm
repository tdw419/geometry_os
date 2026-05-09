; DESCRIPTION: Places a cyan line segment connecting (510, 218) to (86, 83).
; PLAN: r0=510(x1), r1=218(y1), r2=86(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 218
LDI r2, 86
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
