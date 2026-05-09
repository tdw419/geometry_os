; DESCRIPTION: Composite: Renders a black disk with center (105, 140) and radius 65 then Places a yellow 68x93 rectangle at position (269, 18).
; PLAN: r0=105(x), r1=140(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=269(x), r6=18(y), r7=68(width), r8=93(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 140
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 269
LDI r6, 18
LDI r7, 68
LDI r8, 93
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
