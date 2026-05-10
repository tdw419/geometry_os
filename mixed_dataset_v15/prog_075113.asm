; DESCRIPTION: Places a green line segment connecting (409, 243) to (30, 83).
; PLAN: r0=409(x1), r1=243(y1), r2=30(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 243
LDI r2, 30
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
