; DESCRIPTION: Composite: Places a cyan 21x78 rectangle at position (433, 23) then Places a black line segment connecting (396, 221) to (64, 115) then Places a purple dot at position (406, 127).
; PLAN: r0=433(x), r1=23(y), r2=21(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x1), r6=221(y1), r7=64(x2), r8=115(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=127(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 433
LDI r1, 23
LDI r2, 21
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 221
LDI r7, 64
LDI r8, 115
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 127
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
