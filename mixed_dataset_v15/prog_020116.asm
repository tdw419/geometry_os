; DESCRIPTION: Draws a green line from (436, 242) to (138, 45).
; PLAN: r0=436(x1), r1=242(y1), r2=138(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 242
LDI r2, 138
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
