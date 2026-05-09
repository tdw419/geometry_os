; DESCRIPTION: Composite: Renders a blue box of size 32x53 starting at (118, 79) then Places a yellow circle of radius 52 at center (66, 62).
; PLAN: r0=118(x), r1=79(y), r2=32(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=62(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 118
LDI r1, 79
LDI r2, 32
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 62
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
