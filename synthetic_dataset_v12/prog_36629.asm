; DESCRIPTION: Composite: Draws a red circle centered at (228, 129) with radius 74 then Draws a blue line from (388, 98) to (426, 110) then Places a black 14x103 rectangle at position (377, 129).
; PLAN: r0=228(x), r1=129(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x1), r6=98(y1), r7=426(x2), r8=110(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=377(x), r11=129(y), r12=14(width), r13=103(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 228
LDI r1, 129
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 98
LDI r7, 426
LDI r8, 110
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 129
LDI r12, 14
LDI r13, 103
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
