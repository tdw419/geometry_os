; DESCRIPTION: Composite: Places a yellow circle of radius 54 at center (87, 125) then Places a cyan 24x18 rectangle at position (341, 120) then Places a purple dot at position (111, 141).
; PLAN: r0=87(x), r1=125(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x), r6=120(y), r7=24(width), r8=18(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=111(x), r11=141(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 125
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 120
LDI r7, 24
LDI r8, 18
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 141
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
