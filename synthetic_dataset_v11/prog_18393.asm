; DESCRIPTION: Draws a black line from (202, 190) to (3, 29).
; PLAN: r0=202(x1), r1=190(y1), r2=3(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 190
LDI r2, 3
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
