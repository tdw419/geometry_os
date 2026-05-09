; DESCRIPTION: Composite: Sets a single red pixel at (93, 205) then Places a white 48x14 rectangle at position (288, 190) then Renders a magenta disk with center (244, 138) and radius 73.
; PLAN: r0=93(x), r1=205(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=190(y), r7=48(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=244(x), r11=138(y), r12=73(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 93
LDI r1, 205
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 288
LDI r6, 190
LDI r7, 48
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 244
LDI r11, 138
LDI r12, 73
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
