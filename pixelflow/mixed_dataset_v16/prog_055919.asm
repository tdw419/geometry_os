; DESCRIPTION: Composite: Draws a red line from (50, 89) to (441, 164) then Places a white 55x60 rectangle at position (364, 184) then Places a cyan dot at position (83, 251).
; PLAN: r0=50(x1), r1=89(y1), r2=441(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=364(x), r6=184(y), r7=55(width), r8=60(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=83(x), r11=251(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 89
LDI r2, 441
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 184
LDI r7, 55
LDI r8, 60
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 251
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
