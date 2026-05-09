; DESCRIPTION: Composite: Places a white line segment connecting (201, 90) to (366, 143) then Draws a orange rectangle at (397, 42) with width 98 and height 20 then Places a cyan dot at position (447, 199).
; PLAN: r0=201(x1), r1=90(y1), r2=366(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=42(y), r7=98(width), r8=20(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=447(x), r11=199(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 201
LDI r1, 90
LDI r2, 366
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 42
LDI r7, 98
LDI r8, 20
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 447
LDI r11, 199
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
