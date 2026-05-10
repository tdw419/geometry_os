; DESCRIPTION: Draws a green line from (467, 242) to (282, 217).
; PLAN: r0=467(x1), r1=242(y1), r2=282(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 242
LDI r2, 282
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
