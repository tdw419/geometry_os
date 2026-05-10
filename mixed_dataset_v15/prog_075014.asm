; DESCRIPTION: Composite: Places a cyan circle of radius 24 at center (326, 135) then Places a cyan 51x28 rectangle at position (173, 101) then Places a blue dot at position (371, 251).
; PLAN: r0=326(x), r1=135(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=101(y), r7=51(width), r8=28(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=251(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 135
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 101
LDI r7, 51
LDI r8, 28
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 251
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
