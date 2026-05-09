; DESCRIPTION: Places a cyan line segment connecting (184, 104) to (207, 126).
; PLAN: r0=184(x1), r1=104(y1), r2=207(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 104
LDI r2, 207
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
