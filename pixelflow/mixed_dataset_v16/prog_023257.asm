; DESCRIPTION: Draws a green line from (151, 238) to (254, 18).
; PLAN: r0=151(x1), r1=238(y1), r2=254(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 238
LDI r2, 254
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
