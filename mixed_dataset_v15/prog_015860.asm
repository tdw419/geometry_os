; DESCRIPTION: Composite: Renders a yellow line between points (135, 163) and (21, 46) then Draws a yellow rectangle at (63, 49) with width 94 and height 88 then Sets a single magenta pixel at (382, 71).
; PLAN: r0=135(x1), r1=163(y1), r2=21(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=49(y), r7=94(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x), r11=71(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 163
LDI r2, 21
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 49
LDI r7, 94
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 71
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
