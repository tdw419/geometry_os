; DESCRIPTION: Places a green line segment connecting (107, 236) to (380, 211).
; PLAN: r0=107(x1), r1=236(y1), r2=380(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 236
LDI r2, 380
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
