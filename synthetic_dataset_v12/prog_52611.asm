; DESCRIPTION: Composite: Draws a white line from (201, 147) to (28, 48) then Places a cyan 89x24 rectangle at position (372, 43) then Places a yellow dot at position (178, 177).
; PLAN: r0=201(x1), r1=147(y1), r2=28(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=43(y), r7=89(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=178(x), r11=177(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 147
LDI r2, 28
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 43
LDI r7, 89
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 177
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
