; DESCRIPTION: Places a cyan line segment connecting (34, 107) to (210, 254).
; PLAN: r0=34(x1), r1=107(y1), r2=210(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 107
LDI r2, 210
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
