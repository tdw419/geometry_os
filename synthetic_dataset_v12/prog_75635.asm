; DESCRIPTION: Draws a black line from (387, 83) to (362, 226).
; PLAN: r0=387(x1), r1=83(y1), r2=362(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 83
LDI r2, 362
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
