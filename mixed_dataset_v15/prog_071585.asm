; DESCRIPTION: Composite: Places a magenta circle of radius 29 at center (395, 38) then Places a orange dot at position (179, 198).
; PLAN: r0=395(x), r1=38(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=198(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 395
LDI r1, 38
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 198
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
