; DESCRIPTION: Composite: Renders a orange box of size 72x116 starting at (250, 85) then Creates a yellow circular shape at (321, 116) with radius 59 then Places a cyan dot at position (241, 82).
; PLAN: r0=250(x), r1=85(y), r2=72(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x), r6=116(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=241(x), r11=82(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 250
LDI r1, 85
LDI r2, 72
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 116
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 241
LDI r11, 82
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
