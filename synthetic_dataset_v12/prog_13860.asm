; DESCRIPTION: Composite: Places a purple 111x60 rectangle at position (248, 112) then Places a green circle of radius 62 at center (193, 151).
; PLAN: r0=248(x), r1=112(y), r2=111(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=151(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 112
LDI r2, 111
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 151
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
