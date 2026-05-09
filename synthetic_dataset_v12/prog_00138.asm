; DESCRIPTION: Draws a green line from (287, 32) to (493, 24).
; PLAN: r0=287(x1), r1=32(y1), r2=493(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 32
LDI r2, 493
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
