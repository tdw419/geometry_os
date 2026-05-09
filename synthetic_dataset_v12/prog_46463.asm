; DESCRIPTION: Draws a blue line from (50, 82) to (303, 11).
; PLAN: r0=50(x1), r1=82(y1), r2=303(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 82
LDI r2, 303
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
