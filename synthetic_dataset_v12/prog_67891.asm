; DESCRIPTION: Composite: Sets a single magenta pixel at (199, 223) then Draws a purple rectangle at (353, 99) with width 21 and height 32.
; PLAN: r0=199(x), r1=223(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=99(y), r7=21(width), r8=32(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 223
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 99
LDI r7, 21
LDI r8, 32
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
