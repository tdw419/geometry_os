; DESCRIPTION: Composite: Draws a magenta rectangle at (190, 143) with width 98 and height 17 then Renders a magenta line between points (352, 31) and (354, 29) then Places a blue dot at position (389, 241).
; PLAN: r0=190(x), r1=143(y), r2=98(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=352(x1), r6=31(y1), r7=354(x2), r8=29(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=389(x), r11=241(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 143
LDI r2, 98
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 352
LDI r6, 31
LDI r7, 354
LDI r8, 29
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 241
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
