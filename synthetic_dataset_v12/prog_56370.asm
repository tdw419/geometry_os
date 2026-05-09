; DESCRIPTION: Composite: Sets a single green pixel at (53, 243) then Draws a magenta rectangle at (369, 24) with width 79 and height 42.
; PLAN: r0=53(x), r1=243(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=24(y), r7=79(width), r8=42(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 243
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 369
LDI r6, 24
LDI r7, 79
LDI r8, 42
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
