; DESCRIPTION: Places a cyan line segment connecting (300, 62) to (370, 208).
; PLAN: r0=300(x1), r1=62(y1), r2=370(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 62
LDI r2, 370
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
