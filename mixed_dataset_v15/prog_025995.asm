; DESCRIPTION: Draws a blue line from (286, 230) to (178, 143).
; PLAN: r0=286(x1), r1=230(y1), r2=178(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 230
LDI r2, 178
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
