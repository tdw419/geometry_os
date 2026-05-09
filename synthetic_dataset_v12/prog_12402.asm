; DESCRIPTION: Draws a blue line from (298, 18) to (184, 115).
; PLAN: r0=298(x1), r1=18(y1), r2=184(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 18
LDI r2, 184
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
