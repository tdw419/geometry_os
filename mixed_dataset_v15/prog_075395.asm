; DESCRIPTION: Composite: Draws a yellow circle centered at (465, 72) with radius 21 then Places a magenta dot at position (498, 41) then Draws a cyan rectangle at (146, 141) with width 93 and height 82.
; PLAN: r0=465(x), r1=72(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=41(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=141(y), r12=93(width), r13=82(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 72
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 41
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 146
LDI r11, 141
LDI r12, 93
LDI r13, 82
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
