; DESCRIPTION: Composite: Creates a blue circular shape at (44, 206) with radius 28 then Places a green dot at position (309, 212) then Places a white 57x26 rectangle at position (251, 164).
; PLAN: r0=44(x), r1=206(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=212(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=251(x), r11=164(y), r12=57(width), r13=26(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 206
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 212
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 251
LDI r11, 164
LDI r12, 57
LDI r13, 26
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
