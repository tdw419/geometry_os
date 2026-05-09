; DESCRIPTION: Draws a black line from (141, 98) to (38, 86).
; PLAN: r0=141(x1), r1=98(y1), r2=38(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 98
LDI r2, 38
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
