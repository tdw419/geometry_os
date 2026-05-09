; DESCRIPTION: Composite: Places a magenta dot at position (27, 74) then Renders a white box of size 83x72 starting at (26, 93) then Draws a cyan circle centered at (337, 54) with radius 51.
; PLAN: r0=27(x), r1=74(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=26(x), r6=93(y), r7=83(width), r8=72(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=337(x), r11=54(y), r12=51(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 27
LDI r1, 74
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 26
LDI r6, 93
LDI r7, 83
LDI r8, 72
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 54
LDI r12, 51
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
