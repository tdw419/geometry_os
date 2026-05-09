; DESCRIPTION: Draws a blue line from (104, 251) to (82, 195).
; PLAN: r0=104(x1), r1=251(y1), r2=82(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 251
LDI r2, 82
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
