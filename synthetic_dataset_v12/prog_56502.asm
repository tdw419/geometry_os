; DESCRIPTION: Composite: Draws a green line from (140, 160) to (190, 80) then Places a yellow 55x40 rectangle at position (391, 151) then Places a yellow dot at position (306, 192).
; PLAN: r0=140(x1), r1=160(y1), r2=190(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=151(y), r7=55(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=306(x), r11=192(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 160
LDI r2, 190
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 151
LDI r7, 55
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 192
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
