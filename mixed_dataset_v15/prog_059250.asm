; DESCRIPTION: Places a green line segment connecting (65, 21) to (335, 29).
; PLAN: r0=65(x1), r1=21(y1), r2=335(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 21
LDI r2, 335
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
