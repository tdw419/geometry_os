; DESCRIPTION: Composite: Places a cyan line segment connecting (495, 130) to (237, 101) then Creates a red rectangular region at (248, 10) spanning 34 by 18 pixels then Places a yellow dot at position (418, 57).
; PLAN: r0=495(x1), r1=130(y1), r2=237(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=10(y), r7=34(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x), r11=57(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 495
LDI r1, 130
LDI r2, 237
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 10
LDI r7, 34
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 57
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
