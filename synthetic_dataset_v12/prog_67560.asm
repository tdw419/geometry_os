; DESCRIPTION: Composite: Places a magenta dot at position (74, 159) then Renders a white line between points (204, 98) and (253, 93) then Draws a red rectangle at (265, 25) with width 95 and height 73.
; PLAN: r0=74(x), r1=159(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=98(y1), r7=253(x2), r8=93(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=25(y), r12=95(width), r13=73(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 159
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 204
LDI r6, 98
LDI r7, 253
LDI r8, 93
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 25
LDI r12, 95
LDI r13, 73
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
