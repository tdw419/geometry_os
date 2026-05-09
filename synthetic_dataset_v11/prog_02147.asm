; DESCRIPTION: Places a cyan line segment connecting (32, 4) to (97, 21).
; PLAN: r0=32(x1), r1=4(y1), r2=97(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 4
LDI r2, 97
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
