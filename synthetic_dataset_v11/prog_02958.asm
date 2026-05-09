; DESCRIPTION: Places a green line segment connecting (69, 197) to (197, 162).
; PLAN: r0=69(x1), r1=197(y1), r2=197(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 197
LDI r2, 197
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
