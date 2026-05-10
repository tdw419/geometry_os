; DESCRIPTION: Composite: Places a green 89x78 rectangle at position (247, 72) then Places a red dot at position (244, 57) then Places a orange circle of radius 34 at center (261, 193).
; PLAN: r0=247(x), r1=72(y), r2=89(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=57(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=261(x), r11=193(y), r12=34(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 247
LDI r1, 72
LDI r2, 89
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 57
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 261
LDI r11, 193
LDI r12, 34
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
