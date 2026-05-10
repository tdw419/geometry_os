; DESCRIPTION: Composite: Renders a magenta box of size 14x28 starting at (41, 55) then Renders a yellow disk with center (355, 149) and radius 65 then Places a yellow dot at position (98, 142).
; PLAN: r0=41(x), r1=55(y), r2=14(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=149(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x), r11=142(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 41
LDI r1, 55
LDI r2, 14
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 149
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 142
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
