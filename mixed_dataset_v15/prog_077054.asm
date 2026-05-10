; DESCRIPTION: Composite: Creates a magenta circular shape at (297, 138) with radius 24 then Places a white dot at position (250, 16) then Places a green 29x12 rectangle at position (225, 236).
; PLAN: r0=297(x), r1=138(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=16(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=236(y), r12=29(width), r13=12(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 138
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 16
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 225
LDI r11, 236
LDI r12, 29
LDI r13, 12
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
