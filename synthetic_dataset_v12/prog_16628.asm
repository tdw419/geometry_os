; DESCRIPTION: Places a cyan line segment connecting (16, 127) to (110, 207).
; PLAN: r0=16(x1), r1=127(y1), r2=110(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 127
LDI r2, 110
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
