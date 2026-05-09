; DESCRIPTION: Places a cyan line segment connecting (29, 151) to (9, 110).
; PLAN: r0=29(x1), r1=151(y1), r2=9(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 151
LDI r2, 9
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
