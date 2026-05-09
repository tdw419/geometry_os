; DESCRIPTION: Places a cyan line segment connecting (209, 40) to (285, 99).
; PLAN: r0=209(x1), r1=40(y1), r2=285(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 40
LDI r2, 285
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
