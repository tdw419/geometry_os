; DESCRIPTION: Composite: Places a orange 42x89 rectangle at position (296, 84) then Places a red line segment connecting (316, 0) to (400, 65) then Places a yellow dot at position (182, 210).
; PLAN: r0=296(x), r1=84(y), r2=42(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x1), r6=0(y1), r7=400(x2), r8=65(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=210(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 84
LDI r2, 42
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 0
LDI r7, 400
LDI r8, 65
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 210
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
