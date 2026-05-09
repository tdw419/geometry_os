; DESCRIPTION: Composite: Draws a red rectangle at (305, 24) with width 75 and height 74 then Sets a single purple pixel at (280, 224).
; PLAN: r0=305(x), r1=24(y), r2=75(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=224(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 305
LDI r1, 24
LDI r2, 75
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 224
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
