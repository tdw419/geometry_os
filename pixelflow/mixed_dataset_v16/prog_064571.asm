; DESCRIPTION: Composite: Draws a black line from (255, 164) to (493, 13) then Places a black circle of radius 23 at center (311, 73).
; PLAN: r0=255(x1), r1=164(y1), r2=493(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=73(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 255
LDI r1, 164
LDI r2, 493
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 73
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
