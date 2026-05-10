; DESCRIPTION: Composite: Draws a white circle centered at (468, 42) with radius 30 then Draws a orange line from (29, 254) to (301, 235) then Places a blue dot at position (448, 96).
; PLAN: r0=468(x), r1=42(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x1), r6=254(y1), r7=301(x2), r8=235(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=448(x), r11=96(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 468
LDI r1, 42
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 254
LDI r7, 301
LDI r8, 235
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 96
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
