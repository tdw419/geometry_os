; DESCRIPTION: Composite: Draws a cyan circle centered at (79, 74) with radius 27 then Draws a magenta rectangle at (228, 0) with width 68 and height 35.
; PLAN: r0=79(x), r1=74(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=0(y), r7=68(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 74
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 0
LDI r7, 68
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
