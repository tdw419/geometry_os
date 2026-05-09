; DESCRIPTION: Places a cyan line segment connecting (68, 99) to (499, 93).
; PLAN: r0=68(x1), r1=99(y1), r2=499(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 99
LDI r2, 499
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
