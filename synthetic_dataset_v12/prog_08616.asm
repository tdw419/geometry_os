; DESCRIPTION: Places a green line segment connecting (70, 221) to (359, 187).
; PLAN: r0=70(x1), r1=221(y1), r2=359(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 221
LDI r2, 359
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
