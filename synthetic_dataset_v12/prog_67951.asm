; DESCRIPTION: Composite: Draws a magenta circle centered at (174, 213) with radius 15 then Renders a yellow line between points (489, 5) and (238, 246) then Places a cyan dot at position (489, 156).
; PLAN: r0=174(x), r1=213(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=489(x1), r6=5(y1), r7=238(x2), r8=246(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=489(x), r11=156(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 213
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 489
LDI r6, 5
LDI r7, 238
LDI r8, 246
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 489
LDI r11, 156
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
