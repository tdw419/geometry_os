; DESCRIPTION: Composite: Renders a purple disk with center (264, 42) and radius 33 then Renders a purple box of size 48x26 starting at (124, 167) then Sets a single white pixel at (136, 150).
; PLAN: r0=264(x), r1=42(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=167(y), r7=48(width), r8=26(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=136(x), r11=150(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 42
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 167
LDI r7, 48
LDI r8, 26
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 150
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
