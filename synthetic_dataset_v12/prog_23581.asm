; DESCRIPTION: Draws a yellow line from (76, 210) to (252, 193).
; PLAN: r0=76(x1), r1=210(y1), r2=252(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 210
LDI r2, 252
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
