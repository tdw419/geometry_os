; DESCRIPTION: Composite: Creates a blue circular shape at (377, 118) with radius 16 then Sets a single purple pixel at (98, 5) then Draws a white line from (188, 98) to (131, 197).
; PLAN: r0=377(x), r1=118(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=5(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=188(x1), r11=98(y1), r12=131(x2), r13=197(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 118
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 5
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 188
LDI r11, 98
LDI r12, 131
LDI r13, 197
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
