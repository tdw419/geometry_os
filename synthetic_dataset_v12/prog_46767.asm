; DESCRIPTION: Composite: Places a magenta dot at position (367, 109) then Draws a green rectangle at (304, 154) with width 115 and height 52.
; PLAN: r0=367(x), r1=109(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=304(x), r6=154(y), r7=115(width), r8=52(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 109
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 304
LDI r6, 154
LDI r7, 115
LDI r8, 52
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
