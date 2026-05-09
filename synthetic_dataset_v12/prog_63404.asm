; DESCRIPTION: Draws a blue line from (82, 19) to (241, 164).
; PLAN: r0=82(x1), r1=19(y1), r2=241(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 19
LDI r2, 241
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
