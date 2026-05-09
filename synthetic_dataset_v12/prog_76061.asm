; DESCRIPTION: Composite: Sets a single white pixel at (270, 164) then Renders a white box of size 88x65 starting at (2, 129) then Draws a black line from (220, 109) to (334, 63).
; PLAN: r0=270(x), r1=164(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=2(x), r6=129(y), r7=88(width), r8=65(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=220(x1), r11=109(y1), r12=334(x2), r13=63(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 164
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 2
LDI r6, 129
LDI r7, 88
LDI r8, 65
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 109
LDI r12, 334
LDI r13, 63
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
