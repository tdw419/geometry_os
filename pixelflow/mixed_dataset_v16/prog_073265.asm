; DESCRIPTION: Composite: Places a purple dot at position (344, 94) then Draws a magenta circle centered at (112, 73) with radius 46.
; PLAN: r0=344(x), r1=94(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=73(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 344
LDI r1, 94
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 73
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
