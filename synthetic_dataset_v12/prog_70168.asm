; DESCRIPTION: Draws a blue line from (460, 213) to (461, 243).
; PLAN: r0=460(x1), r1=213(y1), r2=461(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 213
LDI r2, 461
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
