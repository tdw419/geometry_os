; DESCRIPTION: Composite: Draws a magenta rectangle at (365, 108) with width 49 and height 66 then Sets a single white pixel at (503, 103).
; PLAN: r0=365(x), r1=108(y), r2=49(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=503(x), r6=103(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 365
LDI r1, 108
LDI r2, 49
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 103
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
