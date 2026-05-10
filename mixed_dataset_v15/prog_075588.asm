; DESCRIPTION: Composite: Renders a white box of size 42x81 starting at (360, 158) then Places a blue dot at position (78, 92) then Renders a cyan line between points (351, 225) and (160, 209).
; PLAN: r0=360(x), r1=158(y), r2=42(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=351(x1), r11=225(y1), r12=160(x2), r13=209(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 158
LDI r2, 42
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 351
LDI r11, 225
LDI r12, 160
LDI r13, 209
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
