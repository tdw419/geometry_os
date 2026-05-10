; DESCRIPTION: Places a black line segment connecting (197, 127) to (465, 190).
; PLAN: r0=197(x1), r1=127(y1), r2=465(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 127
LDI r2, 465
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
