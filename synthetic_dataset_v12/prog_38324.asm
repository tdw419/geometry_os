; DESCRIPTION: Places a green line segment connecting (230, 121) to (275, 73).
; PLAN: r0=230(x1), r1=121(y1), r2=275(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 121
LDI r2, 275
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
