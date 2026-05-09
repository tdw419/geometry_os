; DESCRIPTION: Composite: Places a blue 106x59 rectangle at position (339, 164) then Places a cyan circle of radius 74 at center (309, 128).
; PLAN: r0=339(x), r1=164(y), r2=106(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=128(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 164
LDI r2, 106
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 128
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
