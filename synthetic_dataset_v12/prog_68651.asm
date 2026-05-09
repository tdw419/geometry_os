; DESCRIPTION: Composite: Places a blue line segment connecting (480, 12) to (231, 73) then Sets a single white pixel at (151, 114).
; PLAN: r0=480(x1), r1=12(y1), r2=231(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=114(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 480
LDI r1, 12
LDI r2, 231
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 114
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
