; DESCRIPTION: Places a cyan line segment connecting (44, 156) to (50, 83).
; PLAN: r0=44(x1), r1=156(y1), r2=50(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 156
LDI r2, 50
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
