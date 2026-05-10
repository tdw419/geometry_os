; DESCRIPTION: Composite: Places a green 21x74 rectangle at position (94, 73) then Places a magenta circle of radius 50 at center (360, 101).
; PLAN: r0=94(x), r1=73(y), r2=21(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=101(y), r7=50(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 94
LDI r1, 73
LDI r2, 21
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 101
LDI r7, 50
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
