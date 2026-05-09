; DESCRIPTION: Composite: Places a orange 110x95 rectangle at position (143, 117) then Places a magenta circle of radius 64 at center (198, 95).
; PLAN: r0=143(x), r1=117(y), r2=110(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=95(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 117
LDI r2, 110
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 95
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
