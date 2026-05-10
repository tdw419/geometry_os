; DESCRIPTION: Composite: Sets a single magenta pixel at (494, 255) then Renders a cyan line between points (36, 217) and (268, 88) then Draws a yellow rectangle at (275, 49) with width 53 and height 113.
; PLAN: r0=494(x), r1=255(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=36(x1), r6=217(y1), r7=268(x2), r8=88(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=275(x), r11=49(y), r12=53(width), r13=113(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 255
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 36
LDI r6, 217
LDI r7, 268
LDI r8, 88
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 49
LDI r12, 53
LDI r13, 113
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
