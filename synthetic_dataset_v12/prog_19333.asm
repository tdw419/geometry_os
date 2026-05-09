; DESCRIPTION: Renders a green line between points (97, 117) and (380, 222).
; PLAN: r0=97(x1), r1=117(y1), r2=380(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 117
LDI r2, 380
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
