; DESCRIPTION: Composite: Draws a magenta rectangle at (409, 82) with width 87 and height 51 then Places a red circle of radius 71 at center (188, 143) then Places a magenta dot at position (98, 107).
; PLAN: r0=409(x), r1=82(y), r2=87(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x), r6=143(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x), r11=107(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 82
LDI r2, 87
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 143
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 107
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
