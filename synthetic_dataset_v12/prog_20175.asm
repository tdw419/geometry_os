; DESCRIPTION: Composite: Renders a yellow line between points (126, 242) and (55, 79) then Draws a white rectangle at (214, 98) with width 26 and height 63.
; PLAN: r0=126(x1), r1=242(y1), r2=55(x2), r3=79(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=98(y), r7=26(width), r8=63(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 242
LDI r2, 55
LDI r3, 79
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 98
LDI r7, 26
LDI r8, 63
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
