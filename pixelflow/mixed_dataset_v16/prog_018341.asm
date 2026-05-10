; DESCRIPTION: Draws a black line from (294, 38) to (268, 197).
; PLAN: r0=294(x1), r1=38(y1), r2=268(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 38
LDI r2, 268
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
