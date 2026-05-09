; DESCRIPTION: Places a white line segment connecting (440, 212) to (295, 139).
; PLAN: r0=440(x1), r1=212(y1), r2=295(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 212
LDI r2, 295
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
