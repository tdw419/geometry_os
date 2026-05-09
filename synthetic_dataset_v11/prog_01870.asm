; DESCRIPTION: Places a cyan line segment connecting (143, 188) to (9, 248).
; PLAN: r0=143(x1), r1=188(y1), r2=9(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 188
LDI r2, 9
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
