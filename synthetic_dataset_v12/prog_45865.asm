; DESCRIPTION: Places a green line segment connecting (344, 166) to (120, 94).
; PLAN: r0=344(x1), r1=166(y1), r2=120(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 166
LDI r2, 120
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
