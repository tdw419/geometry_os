; DESCRIPTION: Places a cyan line segment connecting (509, 176) to (259, 141).
; PLAN: r0=509(x1), r1=176(y1), r2=259(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 176
LDI r2, 259
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
