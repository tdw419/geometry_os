; DESCRIPTION: Draws a cyan circle centered at (276, 143) with radius 36.
; PLAN: r0=276(x), r1=143(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 143
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
