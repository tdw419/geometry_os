; DESCRIPTION: Composite: Places a cyan circle of radius 41 at center (191, 76) then Places a green dot at position (127, 228) then Draws a orange line from (42, 84) to (332, 28).
; PLAN: r0=191(x), r1=76(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=228(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=42(x1), r11=84(y1), r12=332(x2), r13=28(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 76
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 228
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 42
LDI r11, 84
LDI r12, 332
LDI r13, 28
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
