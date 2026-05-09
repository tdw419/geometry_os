; DESCRIPTION: Composite: Places a red dot at position (115, 94) then Creates a orange rectangular region at (231, 14) spanning 64 by 57 pixels then Places a cyan line segment connecting (72, 100) to (19, 2).
; PLAN: r0=115(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=14(y), r7=64(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=72(x1), r11=100(y1), r12=19(x2), r13=2(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 94
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 231
LDI r6, 14
LDI r7, 64
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 100
LDI r12, 19
LDI r13, 2
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
