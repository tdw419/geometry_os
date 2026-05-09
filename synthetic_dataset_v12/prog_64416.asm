; DESCRIPTION: Places a green line segment connecting (46, 36) to (445, 183).
; PLAN: r0=46(x1), r1=36(y1), r2=445(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 36
LDI r2, 445
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
