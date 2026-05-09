; DESCRIPTION: Places a cyan line segment connecting (319, 13) to (499, 161).
; PLAN: r0=319(x1), r1=13(y1), r2=499(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 13
LDI r2, 499
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
