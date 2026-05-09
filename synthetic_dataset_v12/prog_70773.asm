; DESCRIPTION: Draws a yellow line from (287, 98) to (82, 33).
; PLAN: r0=287(x1), r1=98(y1), r2=82(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 98
LDI r2, 82
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
