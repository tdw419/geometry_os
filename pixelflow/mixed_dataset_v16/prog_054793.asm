; DESCRIPTION: Composite: Renders a blue disk with center (147, 145) and radius 70 then Places a purple 106x119 rectangle at position (161, 73).
; PLAN: r0=147(x), r1=145(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=73(y), r7=106(width), r8=119(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 145
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 73
LDI r7, 106
LDI r8, 119
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
