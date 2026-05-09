; DESCRIPTION: Composite: Renders a yellow box of size 17x109 starting at (445, 3) then Creates a blue circular shape at (268, 180) with radius 32 then Draws a green line from (258, 0) to (479, 19).
; PLAN: r0=445(x), r1=3(y), r2=17(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=180(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x1), r11=0(y1), r12=479(x2), r13=19(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 3
LDI r2, 17
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 180
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 0
LDI r12, 479
LDI r13, 19
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
