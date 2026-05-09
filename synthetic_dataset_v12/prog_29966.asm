; DESCRIPTION: Places a green line segment connecting (174, 158) to (65, 166).
; PLAN: r0=174(x1), r1=158(y1), r2=65(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 158
LDI r2, 65
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
