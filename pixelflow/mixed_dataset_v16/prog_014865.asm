; DESCRIPTION: Composite: Renders a orange line between points (411, 67) and (372, 244) then Renders a cyan box of size 42x39 starting at (209, 200) then Sets a single green pixel at (62, 72).
; PLAN: r0=411(x1), r1=67(y1), r2=372(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=209(x), r6=200(y), r7=42(width), r8=39(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x), r11=72(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 411
LDI r1, 67
LDI r2, 372
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 200
LDI r7, 42
LDI r8, 39
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 72
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
