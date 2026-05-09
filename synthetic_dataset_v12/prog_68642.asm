; DESCRIPTION: Composite: Draws a yellow circle centered at (100, 130) with radius 47 then Places a blue 104x87 rectangle at position (235, 44) then Renders a cyan line between points (333, 57) and (343, 33).
; PLAN: r0=100(x), r1=130(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=235(x), r6=44(y), r7=104(width), r8=87(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=333(x1), r11=57(y1), r12=343(x2), r13=33(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 130
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 235
LDI r6, 44
LDI r7, 104
LDI r8, 87
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 57
LDI r12, 343
LDI r13, 33
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
