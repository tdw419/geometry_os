; DESCRIPTION: Composite: Draws a yellow line from (426, 27) to (44, 249) then Places a cyan dot at position (461, 186) then Draws a magenta circle centered at (255, 134) with radius 78.
; PLAN: r0=426(x1), r1=27(y1), r2=44(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=186(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=255(x), r11=134(y), r12=78(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 27
LDI r2, 44
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 186
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 255
LDI r11, 134
LDI r12, 78
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
