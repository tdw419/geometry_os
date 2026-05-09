; DESCRIPTION: Places a cyan line segment connecting (110, 98) to (180, 13).
; PLAN: r0=110(x1), r1=98(y1), r2=180(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 98
LDI r2, 180
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
