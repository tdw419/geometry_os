; DESCRIPTION: Composite: Draws a blue line from (450, 184) to (113, 47) then Sets a single yellow pixel at (29, 161).
; PLAN: r0=450(x1), r1=184(y1), r2=113(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=161(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 450
LDI r1, 184
LDI r2, 113
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 161
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
