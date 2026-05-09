; DESCRIPTION: Composite: Draws a black rectangle at (138, 28) with width 111 and height 86 then Renders a orange line between points (345, 93) and (479, 183).
; PLAN: r0=138(x), r1=28(y), r2=111(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x1), r6=93(y1), r7=479(x2), r8=183(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 28
LDI r2, 111
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 93
LDI r7, 479
LDI r8, 183
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
