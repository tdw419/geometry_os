; DESCRIPTION: Places a cyan line segment connecting (449, 125) to (26, 135).
; PLAN: r0=449(x1), r1=125(y1), r2=26(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 125
LDI r2, 26
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
