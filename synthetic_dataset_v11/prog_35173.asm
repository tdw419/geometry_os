; DESCRIPTION: Places a cyan line segment connecting (114, 245) to (176, 206).
; PLAN: r0=114(x1), r1=245(y1), r2=176(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 245
LDI r2, 176
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
