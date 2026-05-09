; DESCRIPTION: Composite: Renders a magenta disk with center (292, 183) and radius 10 then Draws a red rectangle at (154, 112) with width 11 and height 50 then Sets a single purple pixel at (176, 102).
; PLAN: r0=292(x), r1=183(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=154(x), r6=112(y), r7=11(width), r8=50(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x), r11=102(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 183
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 154
LDI r6, 112
LDI r7, 11
LDI r8, 50
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 102
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
