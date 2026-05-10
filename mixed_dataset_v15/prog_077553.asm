; DESCRIPTION: Composite: Draws a magenta circle centered at (57, 93) with radius 27 then Draws a orange rectangle at (228, 138) with width 71 and height 97.
; PLAN: r0=57(x), r1=93(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=138(y), r7=71(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 93
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 138
LDI r7, 71
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
