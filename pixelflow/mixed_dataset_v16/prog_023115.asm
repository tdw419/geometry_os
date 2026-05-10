; DESCRIPTION: Composite: Places a cyan circle of radius 24 at center (329, 24) then Renders a green box of size 43x115 starting at (437, 128) then Places a magenta dot at position (421, 100).
; PLAN: r0=329(x), r1=24(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=128(y), r7=43(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x), r11=100(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 24
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 128
LDI r7, 43
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 100
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
