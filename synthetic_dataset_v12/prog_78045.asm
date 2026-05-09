; DESCRIPTION: Draws a yellow line from (215, 49) to (372, 45).
; PLAN: r0=215(x1), r1=49(y1), r2=372(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 49
LDI r2, 372
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
