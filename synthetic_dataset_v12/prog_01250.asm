; DESCRIPTION: Composite: Renders a magenta line between points (89, 16) and (23, 217) then Places a red 28x84 rectangle at position (62, 115) then Renders a red disk with center (39, 196) and radius 27.
; PLAN: r0=89(x1), r1=16(y1), r2=23(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=115(y), r7=28(width), r8=84(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=39(x), r11=196(y), r12=27(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 89
LDI r1, 16
LDI r2, 23
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 115
LDI r7, 28
LDI r8, 84
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 196
LDI r12, 27
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
