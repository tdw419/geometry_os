; DESCRIPTION: Composite: Places a orange circle of radius 73 at center (251, 148) then Places a blue 57x101 rectangle at position (280, 153) then Places a yellow dot at position (294, 182).
; PLAN: r0=251(x), r1=148(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x), r6=153(y), r7=57(width), r8=101(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=294(x), r11=182(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 148
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 153
LDI r7, 57
LDI r8, 101
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 182
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
