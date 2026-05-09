; DESCRIPTION: Composite: Draws a white line from (413, 12) to (172, 201) then Draws a purple circle centered at (50, 207) with radius 47 then Places a cyan dot at position (250, 166).
; PLAN: r0=413(x1), r1=12(y1), r2=172(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=207(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=250(x), r11=166(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 413
LDI r1, 12
LDI r2, 172
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 207
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 250
LDI r11, 166
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
