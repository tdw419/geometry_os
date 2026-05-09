; DESCRIPTION: Composite: Draws a black rectangle at (235, 9) with width 62 and height 68 then Places a yellow circle of radius 75 at center (429, 93) then Draws a magenta line from (502, 150) to (303, 229).
; PLAN: r0=235(x), r1=9(y), r2=62(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x), r6=93(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=502(x1), r11=150(y1), r12=303(x2), r13=229(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 9
LDI r2, 62
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 93
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 502
LDI r11, 150
LDI r12, 303
LDI r13, 229
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
