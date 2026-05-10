; DESCRIPTION: Places a cyan line segment connecting (153, 141) to (196, 105).
; PLAN: r0=153(x1), r1=141(y1), r2=196(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 141
LDI r2, 196
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
