; DESCRIPTION: Places a cyan line segment connecting (407, 151) to (366, 166).
; PLAN: r0=407(x1), r1=151(y1), r2=366(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 151
LDI r2, 366
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
