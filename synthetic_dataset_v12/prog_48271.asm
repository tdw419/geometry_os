; DESCRIPTION: Draws a black line from (299, 19) to (39, 243).
; PLAN: r0=299(x1), r1=19(y1), r2=39(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 19
LDI r2, 39
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
