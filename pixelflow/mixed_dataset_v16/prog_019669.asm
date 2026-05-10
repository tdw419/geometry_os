; DESCRIPTION: Draws a black line from (53, 134) to (294, 86).
; PLAN: r0=53(x1), r1=134(y1), r2=294(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 134
LDI r2, 294
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
