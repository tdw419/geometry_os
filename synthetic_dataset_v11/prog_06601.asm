; DESCRIPTION: Places a black line segment connecting (4, 197) to (117, 190).
; PLAN: r0=4(x1), r1=197(y1), r2=117(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 197
LDI r2, 117
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
