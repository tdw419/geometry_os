; DESCRIPTION: Composite: Draws a yellow rectangle at (63, 129) with width 55 and height 103 then Sets a single yellow pixel at (261, 9) then Renders a red line between points (243, 186) and (384, 146).
; PLAN: r0=63(x), r1=129(y), r2=55(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x), r6=9(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=243(x1), r11=186(y1), r12=384(x2), r13=146(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 129
LDI r2, 55
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 9
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 243
LDI r11, 186
LDI r12, 384
LDI r13, 146
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
