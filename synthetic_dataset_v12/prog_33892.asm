; DESCRIPTION: Draws a black line from (2, 213) to (164, 161).
; PLAN: r0=2(x1), r1=213(y1), r2=164(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 213
LDI r2, 164
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
