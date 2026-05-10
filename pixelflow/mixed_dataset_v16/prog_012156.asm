; DESCRIPTION: Composite: Draws a magenta rectangle at (54, 72) with width 11 and height 70 then Places a yellow dot at position (401, 200).
; PLAN: r0=54(x), r1=72(y), r2=11(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=200(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 72
LDI r2, 11
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 200
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
