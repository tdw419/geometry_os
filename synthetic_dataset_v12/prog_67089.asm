; DESCRIPTION: Places a cyan line segment connecting (50, 99) to (26, 123).
; PLAN: r0=50(x1), r1=99(y1), r2=26(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 99
LDI r2, 26
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
