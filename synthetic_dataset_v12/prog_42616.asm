; DESCRIPTION: Composite: Draws a magenta rectangle at (302, 13) with width 99 and height 50 then Places a green dot at position (126, 213) then Draws a green line from (214, 118) to (281, 28).
; PLAN: r0=302(x), r1=13(y), r2=99(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=213(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=214(x1), r11=118(y1), r12=281(x2), r13=28(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 13
LDI r2, 99
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 213
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 214
LDI r11, 118
LDI r12, 281
LDI r13, 28
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
