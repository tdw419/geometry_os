; DESCRIPTION: Composite: Places a black 38x89 rectangle at position (167, 95) then Places a white circle of radius 51 at center (362, 129).
; PLAN: r0=167(x), r1=95(y), r2=38(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=129(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 167
LDI r1, 95
LDI r2, 38
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 129
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
