; DESCRIPTION: Composite: Creates a orange rectangular region at (306, 73) spanning 42 by 65 pixels then Places a blue dot at position (82, 149) then Creates a red circular shape at (83, 226) with radius 20.
; PLAN: r0=306(x), r1=73(y), r2=42(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=149(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=83(x), r11=226(y), r12=20(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 306
LDI r1, 73
LDI r2, 42
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 149
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 83
LDI r11, 226
LDI r12, 20
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
