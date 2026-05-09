; DESCRIPTION: Draws a black line from (358, 19) to (295, 187).
; PLAN: r0=358(x1), r1=19(y1), r2=295(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 19
LDI r2, 295
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
