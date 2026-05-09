; DESCRIPTION: Draws a green line from (163, 242) to (207, 64).
; PLAN: r0=163(x1), r1=242(y1), r2=207(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 242
LDI r2, 207
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
