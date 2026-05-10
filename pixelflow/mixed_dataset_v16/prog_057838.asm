; DESCRIPTION: Draws a black line from (82, 113) to (213, 153).
; PLAN: r0=82(x1), r1=113(y1), r2=213(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 113
LDI r2, 213
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
