; DESCRIPTION: Composite: Renders a cyan line between points (230, 3) and (298, 221) then Renders a purple box of size 50x27 starting at (125, 26) then Draws a magenta circle centered at (272, 188) with radius 62.
; PLAN: r0=230(x1), r1=3(y1), r2=298(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=26(y), r7=50(width), r8=27(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=188(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 230
LDI r1, 3
LDI r2, 298
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 26
LDI r7, 50
LDI r8, 27
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 188
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
