; DESCRIPTION: Composite: Draws a cyan line from (429, 85) to (69, 61) then Draws a white circle centered at (336, 86) with radius 43.
; PLAN: r0=429(x1), r1=85(y1), r2=69(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=86(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 429
LDI r1, 85
LDI r2, 69
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 86
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
