; DESCRIPTION: Places a green line segment connecting (303, 210) to (157, 107).
; PLAN: r0=303(x1), r1=210(y1), r2=157(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 210
LDI r2, 157
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
