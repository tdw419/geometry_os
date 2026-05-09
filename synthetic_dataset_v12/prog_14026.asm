; DESCRIPTION: Draws a black line from (165, 236) to (243, 182).
; PLAN: r0=165(x1), r1=236(y1), r2=243(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 236
LDI r2, 243
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
