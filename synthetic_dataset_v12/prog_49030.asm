; DESCRIPTION: Composite: Sets a single orange pixel at (370, 179) then Draws a cyan circle centered at (430, 208) with radius 39 then Draws a white line from (437, 115) to (6, 248).
; PLAN: r0=370(x), r1=179(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=430(x), r6=208(y), r7=39(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=437(x1), r11=115(y1), r12=6(x2), r13=248(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 179
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 430
LDI r6, 208
LDI r7, 39
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 437
LDI r11, 115
LDI r12, 6
LDI r13, 248
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
