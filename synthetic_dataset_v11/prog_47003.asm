; DESCRIPTION: Places a cyan line segment connecting (217, 192) to (247, 231).
; PLAN: r0=217(x1), r1=192(y1), r2=247(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 192
LDI r2, 247
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
