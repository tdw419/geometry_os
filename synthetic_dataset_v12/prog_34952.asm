; DESCRIPTION: Composite: Renders a magenta box of size 36x53 starting at (198, 182) then Sets a single blue pixel at (206, 181).
; PLAN: r0=198(x), r1=182(y), r2=36(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x), r6=181(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 198
LDI r1, 182
LDI r2, 36
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 181
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
