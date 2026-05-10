; DESCRIPTION: Composite: Places a red 67x76 rectangle at position (212, 98) then Draws a yellow line from (319, 232) to (510, 199) then Places a green dot at position (214, 30).
; PLAN: r0=212(x), r1=98(y), r2=67(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x1), r6=232(y1), r7=510(x2), r8=199(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=214(x), r11=30(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 98
LDI r2, 67
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 232
LDI r7, 510
LDI r8, 199
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 30
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
