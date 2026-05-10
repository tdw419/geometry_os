; DESCRIPTION: Composite: Renders a cyan disk with center (183, 134) and radius 70 then Renders a yellow line between points (373, 161) and (290, 27) then Draws a orange rectangle at (75, 37) with width 39 and height 84.
; PLAN: r0=183(x), r1=134(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x1), r6=161(y1), r7=290(x2), r8=27(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=75(x), r11=37(y), r12=39(width), r13=84(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 134
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 161
LDI r7, 290
LDI r8, 27
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 37
LDI r12, 39
LDI r13, 84
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
