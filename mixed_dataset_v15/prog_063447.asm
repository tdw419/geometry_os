; DESCRIPTION: Composite: Renders a blue box of size 27x100 starting at (83, 24) then Renders a blue line between points (87, 181) and (465, 27) then Places a red circle of radius 47 at center (225, 124).
; PLAN: r0=83(x), r1=24(y), r2=27(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x1), r6=181(y1), r7=465(x2), r8=27(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=124(y), r12=47(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 83
LDI r1, 24
LDI r2, 27
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 181
LDI r7, 465
LDI r8, 27
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 124
LDI r12, 47
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
