; DESCRIPTION: Composite: Places a magenta dot at position (93, 130) then Draws a purple rectangle at (445, 144) with width 16 and height 20.
; PLAN: r0=93(x), r1=130(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=445(x), r6=144(y), r7=16(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 130
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 445
LDI r6, 144
LDI r7, 16
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
