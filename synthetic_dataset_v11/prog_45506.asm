; DESCRIPTION: Places a cyan line segment connecting (13, 172) to (220, 83).
; PLAN: r0=13(x1), r1=172(y1), r2=220(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 172
LDI r2, 220
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
