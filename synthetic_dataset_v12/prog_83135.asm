; DESCRIPTION: Composite: Sets a single purple pixel at (212, 105) then Renders a purple disk with center (40, 39) and radius 20 then Places a green 80x21 rectangle at position (52, 126).
; PLAN: r0=212(x), r1=105(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=40(x), r6=39(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=52(x), r11=126(y), r12=80(width), r13=21(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 105
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 39
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 52
LDI r11, 126
LDI r12, 80
LDI r13, 21
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
