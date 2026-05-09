; DESCRIPTION: Composite: Draws a green line from (20, 127) to (360, 152) then Places a purple circle of radius 13 at center (104, 207) then Places a orange dot at position (167, 139).
; PLAN: r0=20(x1), r1=127(y1), r2=360(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=104(x), r6=207(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=167(x), r11=139(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 20
LDI r1, 127
LDI r2, 360
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 207
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 167
LDI r11, 139
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
