; DESCRIPTION: Places a blue line segment connecting (298, 81) to (327, 220).
; PLAN: r0=298(x1), r1=81(y1), r2=327(x2), r3=220(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 81
LDI r2, 327
LDI r3, 220
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
