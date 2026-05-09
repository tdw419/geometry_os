; DESCRIPTION: Composite: Draws a magenta line from (508, 128) to (411, 50) then Draws a orange circle centered at (235, 64) with radius 42 then Places a orange dot at position (299, 186).
; PLAN: r0=508(x1), r1=128(y1), r2=411(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=64(y), r7=42(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=299(x), r11=186(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 508
LDI r1, 128
LDI r2, 411
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 64
LDI r7, 42
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 299
LDI r11, 186
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
