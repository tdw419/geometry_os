; DESCRIPTION: Draws a black line from (173, 243) to (19, 225).
; PLAN: r0=173(x1), r1=243(y1), r2=19(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 243
LDI r2, 19
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
