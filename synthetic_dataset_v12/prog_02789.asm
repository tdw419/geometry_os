; DESCRIPTION: Composite: Draws a yellow rectangle at (473, 115) with width 23 and height 115 then Places a yellow dot at position (105, 37) then Draws a cyan line from (451, 130) to (111, 173).
; PLAN: r0=473(x), r1=115(y), r2=23(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=37(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=451(x1), r11=130(y1), r12=111(x2), r13=173(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 115
LDI r2, 23
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 37
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 451
LDI r11, 130
LDI r12, 111
LDI r13, 173
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
