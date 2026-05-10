; DESCRIPTION: Places a green line segment connecting (354, 19) to (139, 215).
; PLAN: r0=354(x1), r1=19(y1), r2=139(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 19
LDI r2, 139
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
