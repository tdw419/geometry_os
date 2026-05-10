; DESCRIPTION: Composite: Draws a cyan circle centered at (149, 181) with radius 60 then Places a yellow dot at position (312, 113).
; PLAN: r0=149(x), r1=181(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=113(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 181
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 113
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
