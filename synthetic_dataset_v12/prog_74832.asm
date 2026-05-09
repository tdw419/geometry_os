; DESCRIPTION: Composite: Places a magenta dot at position (136, 25) then Creates a cyan circular shape at (487, 119) with radius 20 then Renders a black line between points (59, 29) and (435, 206).
; PLAN: r0=136(x), r1=25(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=487(x), r6=119(y), r7=20(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=59(x1), r11=29(y1), r12=435(x2), r13=206(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 25
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 487
LDI r6, 119
LDI r7, 20
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 59
LDI r11, 29
LDI r12, 435
LDI r13, 206
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
