; DESCRIPTION: Places a cyan line segment connecting (196, 187) to (425, 78).
; PLAN: r0=196(x1), r1=187(y1), r2=425(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 187
LDI r2, 425
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
