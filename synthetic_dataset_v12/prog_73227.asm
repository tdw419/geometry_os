; DESCRIPTION: Composite: Sets a single orange pixel at (48, 32) then Renders a white line between points (167, 185) and (44, 82) then Draws a magenta rectangle at (182, 64) with width 50 and height 47.
; PLAN: r0=48(x), r1=32(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=185(y1), r7=44(x2), r8=82(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=64(y), r12=50(width), r13=47(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 32
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 167
LDI r6, 185
LDI r7, 44
LDI r8, 82
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 64
LDI r12, 50
LDI r13, 47
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
