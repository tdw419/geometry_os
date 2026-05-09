; DESCRIPTION: Composite: Renders a green line between points (224, 165) and (152, 85) then Draws a green rectangle at (426, 8) with width 68 and height 76 then Sets a single magenta pixel at (85, 77).
; PLAN: r0=224(x1), r1=165(y1), r2=152(x2), r3=85(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=8(y), r7=68(width), r8=76(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x), r11=77(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 224
LDI r1, 165
LDI r2, 152
LDI r3, 85
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 8
LDI r7, 68
LDI r8, 76
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 77
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
