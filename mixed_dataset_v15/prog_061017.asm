; DESCRIPTION: Draws a black line from (456, 7) to (16, 94).
; PLAN: r0=456(x1), r1=7(y1), r2=16(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 7
LDI r2, 16
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
