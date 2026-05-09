; DESCRIPTION: Places a blue line segment connecting (354, 207) to (46, 197).
; PLAN: r0=354(x1), r1=207(y1), r2=46(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 207
LDI r2, 46
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
