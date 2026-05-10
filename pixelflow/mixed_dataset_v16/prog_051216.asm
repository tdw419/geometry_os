; DESCRIPTION: Composite: Places a blue line segment connecting (333, 99) to (240, 131) then Places a magenta dot at position (497, 255).
; PLAN: r0=333(x1), r1=99(y1), r2=240(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=497(x), r6=255(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 99
LDI r2, 240
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 255
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
