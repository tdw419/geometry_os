; DESCRIPTION: Composite: Sets a single purple pixel at (168, 4) then Draws a green line from (340, 126) to (477, 210) then Draws a red rectangle at (296, 144) with width 62 and height 46.
; PLAN: r0=168(x), r1=4(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=340(x1), r6=126(y1), r7=477(x2), r8=210(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=144(y), r12=62(width), r13=46(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 4
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 126
LDI r7, 477
LDI r8, 210
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 144
LDI r12, 62
LDI r13, 46
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
