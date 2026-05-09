; DESCRIPTION: Places a green line segment connecting (207, 16) to (168, 175).
; PLAN: r0=207(x1), r1=16(y1), r2=168(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 16
LDI r2, 168
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
