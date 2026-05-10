; DESCRIPTION: Places a cyan line segment connecting (499, 23) to (21, 89).
; PLAN: r0=499(x1), r1=23(y1), r2=21(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 23
LDI r2, 21
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
