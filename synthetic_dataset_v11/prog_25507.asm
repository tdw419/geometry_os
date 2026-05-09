; DESCRIPTION: Places a cyan line segment connecting (150, 22) to (104, 244).
; PLAN: r0=150(x1), r1=22(y1), r2=104(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 22
LDI r2, 104
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
