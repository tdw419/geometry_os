; DESCRIPTION: Composite: Places a orange dot at position (125, 132) then Draws a cyan rectangle at (35, 130) with width 119 and height 100 then Renders a cyan line between points (327, 88) and (333, 19).
; PLAN: r0=125(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=35(x), r6=130(y), r7=119(width), r8=100(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=327(x1), r11=88(y1), r12=333(x2), r13=19(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 132
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 35
LDI r6, 130
LDI r7, 119
LDI r8, 100
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 88
LDI r12, 333
LDI r13, 19
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
