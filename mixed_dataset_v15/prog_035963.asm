; DESCRIPTION: Places a green line segment connecting (423, 151) to (186, 166).
; PLAN: r0=423(x1), r1=151(y1), r2=186(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 151
LDI r2, 186
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
