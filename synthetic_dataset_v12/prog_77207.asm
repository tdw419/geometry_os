; DESCRIPTION: Composite: Renders a cyan disk with center (81, 146) and radius 65 then Renders a blue box of size 13x81 starting at (157, 101) then Places a blue dot at position (372, 8).
; PLAN: r0=81(x), r1=146(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=101(y), r7=13(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=372(x), r11=8(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 146
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 101
LDI r7, 13
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 372
LDI r11, 8
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
