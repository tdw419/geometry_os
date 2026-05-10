; DESCRIPTION: Draws a green line from (122, 55) to (327, 45).
; PLAN: r0=122(x1), r1=55(y1), r2=327(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 55
LDI r2, 327
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
