; DESCRIPTION: Composite: Creates a red circular shape at (389, 122) with radius 12 then Draws a green line from (345, 73) to (301, 144) then Places a white dot at position (179, 251).
; PLAN: r0=389(x), r1=122(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x1), r6=73(y1), r7=301(x2), r8=144(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=179(x), r11=251(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 122
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 73
LDI r7, 301
LDI r8, 144
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 251
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
