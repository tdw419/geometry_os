; DESCRIPTION: Draws a blue line from (252, 25) to (76, 27).
; PLAN: r0=252(x1), r1=25(y1), r2=76(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 25
LDI r2, 76
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
