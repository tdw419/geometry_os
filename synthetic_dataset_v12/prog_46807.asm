; DESCRIPTION: Composite: Draws a red rectangle at (234, 74) with width 25 and height 52 then Places a green dot at position (1, 133).
; PLAN: r0=234(x), r1=74(y), r2=25(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=133(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 234
LDI r1, 74
LDI r2, 25
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 133
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
