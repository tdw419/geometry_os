; DESCRIPTION: Composite: Draws a white rectangle at (214, 100) with width 59 and height 115 then Places a magenta dot at position (458, 34).
; PLAN: r0=214(x), r1=100(y), r2=59(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x), r6=34(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 214
LDI r1, 100
LDI r2, 59
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 34
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
