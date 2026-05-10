; DESCRIPTION: Composite: Draws a orange rectangle at (247, 165) with width 103 and height 81 then Draws a magenta circle centered at (57, 168) with radius 41 then Sets a single cyan pixel at (37, 85).
; PLAN: r0=247(x), r1=165(y), r2=103(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x), r6=168(y), r7=41(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=37(x), r11=85(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 165
LDI r2, 103
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 168
LDI r7, 41
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 37
LDI r11, 85
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
