; DESCRIPTION: Composite: Draws a green rectangle at (277, 158) with width 94 and height 42 then Sets a single magenta pixel at (405, 127) then Draws a cyan circle centered at (265, 176) with radius 66.
; PLAN: r0=277(x), r1=158(y), r2=94(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=127(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=265(x), r11=176(y), r12=66(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 277
LDI r1, 158
LDI r2, 94
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 127
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 265
LDI r11, 176
LDI r12, 66
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
