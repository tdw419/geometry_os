; DESCRIPTION: Places a cyan line segment connecting (287, 151) to (388, 60).
; PLAN: r0=287(x1), r1=151(y1), r2=388(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 151
LDI r2, 388
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
