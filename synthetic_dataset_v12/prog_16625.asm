; DESCRIPTION: Places a cyan line segment connecting (275, 68) to (332, 119).
; PLAN: r0=275(x1), r1=68(y1), r2=332(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 68
LDI r2, 332
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
