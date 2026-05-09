; DESCRIPTION: Composite: Places a magenta dot at position (412, 207) then Draws a white rectangle at (25, 103) with width 79 and height 18 then Renders a blue disk with center (277, 97) and radius 68.
; PLAN: r0=412(x), r1=207(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=25(x), r6=103(y), r7=79(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=277(x), r11=97(y), r12=68(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 412
LDI r1, 207
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 25
LDI r6, 103
LDI r7, 79
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 97
LDI r12, 68
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
