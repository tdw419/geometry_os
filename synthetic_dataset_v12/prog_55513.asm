; DESCRIPTION: Places a cyan line segment connecting (440, 117) to (268, 105).
; PLAN: r0=440(x1), r1=117(y1), r2=268(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 117
LDI r2, 268
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
