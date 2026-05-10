; DESCRIPTION: Composite: Draws a red rectangle at (415, 48) with width 17 and height 58 then Sets a single blue pixel at (409, 164).
; PLAN: r0=415(x), r1=48(y), r2=17(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=164(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 48
LDI r2, 17
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 164
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
