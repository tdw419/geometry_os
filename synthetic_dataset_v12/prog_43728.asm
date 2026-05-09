; DESCRIPTION: Composite: Draws a yellow circle centered at (366, 79) with radius 53 then Places a cyan dot at position (249, 20) then Renders a cyan box of size 66x97 starting at (24, 83).
; PLAN: r0=366(x), r1=79(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=20(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=83(y), r12=66(width), r13=97(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 79
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 20
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 24
LDI r11, 83
LDI r12, 66
LDI r13, 97
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
