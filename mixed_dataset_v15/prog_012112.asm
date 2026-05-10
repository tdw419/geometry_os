; DESCRIPTION: Composite: Places a red 83x115 rectangle at position (95, 38) then Creates a yellow circular shape at (345, 197) with radius 38.
; PLAN: r0=95(x), r1=38(y), r2=83(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=197(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 38
LDI r2, 83
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 197
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
