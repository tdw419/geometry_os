; DESCRIPTION: Composite: Draws a white rectangle at (77, 0) with width 16 and height 38 then Sets a single magenta pixel at (246, 71).
; PLAN: r0=77(x), r1=0(y), r2=16(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x), r6=71(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 0
LDI r2, 16
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 71
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
