; DESCRIPTION: Places a cyan line segment connecting (345, 111) to (474, 34).
; PLAN: r0=345(x1), r1=111(y1), r2=474(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 111
LDI r2, 474
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
