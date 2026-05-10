; DESCRIPTION: Places a green line segment connecting (117, 151) to (268, 43).
; PLAN: r0=117(x1), r1=151(y1), r2=268(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 151
LDI r2, 268
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
