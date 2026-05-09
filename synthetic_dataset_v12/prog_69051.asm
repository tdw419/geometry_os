; DESCRIPTION: Draws a green line from (435, 207) to (164, 17).
; PLAN: r0=435(x1), r1=207(y1), r2=164(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 207
LDI r2, 164
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
