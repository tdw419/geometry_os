; DESCRIPTION: Composite: Places a cyan 29x24 rectangle at position (275, 47) then Places a yellow circle of radius 26 at center (132, 213) then Sets a single green pixel at (52, 66).
; PLAN: r0=275(x), r1=47(y), r2=29(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=213(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x), r11=66(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 275
LDI r1, 47
LDI r2, 29
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 213
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 66
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
