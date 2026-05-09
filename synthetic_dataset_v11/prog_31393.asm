; DESCRIPTION: Places a green line segment connecting (125, 242) to (185, 197).
; PLAN: r0=125(x1), r1=242(y1), r2=185(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 242
LDI r2, 185
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
