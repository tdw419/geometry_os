; DESCRIPTION: Composite: Draws a blue circle centered at (304, 57) with radius 25 then Places a blue dot at position (123, 228).
; PLAN: r0=304(x), r1=57(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x), r6=228(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 57
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 228
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
