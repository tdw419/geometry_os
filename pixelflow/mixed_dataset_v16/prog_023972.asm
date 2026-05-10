; DESCRIPTION: Composite: Places a white 12x107 rectangle at position (247, 10) then Draws a cyan circle centered at (132, 134) with radius 51.
; PLAN: r0=247(x), r1=10(y), r2=12(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=134(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 10
LDI r2, 12
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 134
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
