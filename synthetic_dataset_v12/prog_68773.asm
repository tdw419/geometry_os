; DESCRIPTION: Draws a black line from (35, 197) to (180, 71).
; PLAN: r0=35(x1), r1=197(y1), r2=180(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 197
LDI r2, 180
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
