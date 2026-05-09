; DESCRIPTION: Places a white line segment connecting (161, 98) to (46, 12).
; PLAN: r0=161(x1), r1=98(y1), r2=46(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 98
LDI r2, 46
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
