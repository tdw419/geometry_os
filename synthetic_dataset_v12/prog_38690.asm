; DESCRIPTION: Places a cyan line segment connecting (207, 90) to (326, 227).
; PLAN: r0=207(x1), r1=90(y1), r2=326(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 90
LDI r2, 326
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
