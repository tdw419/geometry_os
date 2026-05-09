; DESCRIPTION: Draws a green line from (230, 82) to (172, 10).
; PLAN: r0=230(x1), r1=82(y1), r2=172(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 82
LDI r2, 172
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
