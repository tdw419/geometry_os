; DESCRIPTION: Draws a black line from (194, 239) to (435, 190).
; PLAN: r0=194(x1), r1=239(y1), r2=435(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 239
LDI r2, 435
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
