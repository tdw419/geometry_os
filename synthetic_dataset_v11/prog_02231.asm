; DESCRIPTION: Places a cyan line segment connecting (94, 117) to (110, 166).
; PLAN: r0=94(x1), r1=117(y1), r2=110(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 117
LDI r2, 110
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
