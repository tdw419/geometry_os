; DESCRIPTION: Composite: Places a cyan 31x84 rectangle at position (457, 34) then Draws a red circle centered at (440, 197) with radius 51 then Places a cyan dot at position (396, 84).
; PLAN: r0=457(x), r1=34(y), r2=31(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=197(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=84(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 457
LDI r1, 34
LDI r2, 31
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 197
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 84
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
