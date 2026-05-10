; DESCRIPTION: Places a cyan line segment connecting (57, 8) to (282, 207).
; PLAN: r0=57(x1), r1=8(y1), r2=282(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 8
LDI r2, 282
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
