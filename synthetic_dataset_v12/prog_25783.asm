; DESCRIPTION: Draws a green line from (418, 84) to (298, 119).
; PLAN: r0=418(x1), r1=84(y1), r2=298(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 84
LDI r2, 298
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
