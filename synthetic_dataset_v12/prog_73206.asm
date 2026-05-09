; DESCRIPTION: Composite: Draws a black line from (337, 99) to (108, 158) then Creates a yellow rectangular region at (32, 84) spanning 115 by 93 pixels then Places a cyan dot at position (104, 90).
; PLAN: r0=337(x1), r1=99(y1), r2=108(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=84(y), r7=115(width), r8=93(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=90(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 99
LDI r2, 108
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 84
LDI r7, 115
LDI r8, 93
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 90
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
