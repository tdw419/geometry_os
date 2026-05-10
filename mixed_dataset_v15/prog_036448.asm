; DESCRIPTION: Composite: Draws a purple circle centered at (60, 65) with radius 22 then Draws a cyan line from (420, 182) to (442, 253) then Places a cyan dot at position (484, 238).
; PLAN: r0=60(x), r1=65(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x1), r6=182(y1), r7=442(x2), r8=253(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=484(x), r11=238(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 60
LDI r1, 65
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 182
LDI r7, 442
LDI r8, 253
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 238
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
