; DESCRIPTION: Places a green line segment connecting (45, 86) to (39, 29).
; PLAN: r0=45(x1), r1=86(y1), r2=39(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 86
LDI r2, 39
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
