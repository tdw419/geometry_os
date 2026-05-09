; DESCRIPTION: Draws a green line from (76, 140) to (300, 32).
; PLAN: r0=76(x1), r1=140(y1), r2=300(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 140
LDI r2, 300
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
