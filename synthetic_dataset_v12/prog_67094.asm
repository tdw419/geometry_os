; DESCRIPTION: Composite: Places a cyan 22x93 rectangle at position (332, 11) then Renders a black disk with center (416, 58) and radius 26.
; PLAN: r0=332(x), r1=11(y), r2=22(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=58(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 332
LDI r1, 11
LDI r2, 22
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 58
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
