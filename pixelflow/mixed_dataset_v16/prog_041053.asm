; DESCRIPTION: Composite: Draws a red rectangle at (339, 228) with width 31 and height 27 then Renders a purple disk with center (214, 190) and radius 27.
; PLAN: r0=339(x), r1=228(y), r2=31(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=190(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 228
LDI r2, 31
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 190
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
