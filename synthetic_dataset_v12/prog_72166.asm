; DESCRIPTION: Places a red line segment connecting (436, 161) to (17, 146).
; PLAN: r0=436(x1), r1=161(y1), r2=17(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 161
LDI r2, 17
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
