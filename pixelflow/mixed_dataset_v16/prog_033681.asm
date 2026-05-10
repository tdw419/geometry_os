; DESCRIPTION: Composite: Renders a cyan box of size 94x32 starting at (360, 119) then Draws a purple circle centered at (395, 197) with radius 18.
; PLAN: r0=360(x), r1=119(y), r2=94(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x), r6=197(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 119
LDI r2, 94
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 197
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
