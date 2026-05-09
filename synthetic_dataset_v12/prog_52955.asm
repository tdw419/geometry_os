; DESCRIPTION: Places a green line segment connecting (105, 215) to (380, 145).
; PLAN: r0=105(x1), r1=215(y1), r2=380(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 215
LDI r2, 380
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
