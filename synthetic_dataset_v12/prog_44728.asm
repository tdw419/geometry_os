; DESCRIPTION: Draws a cyan line from (436, 136) to (6, 70).
; PLAN: r0=436(x1), r1=136(y1), r2=6(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 136
LDI r2, 6
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
