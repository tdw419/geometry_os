; DESCRIPTION: Composite: Sets a single magenta pixel at (213, 183) then Renders a purple disk with center (436, 171) and radius 24 then Places a black 78x111 rectangle at position (181, 54).
; PLAN: r0=213(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=436(x), r6=171(y), r7=24(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=181(x), r11=54(y), r12=78(width), r13=111(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 183
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 436
LDI r6, 171
LDI r7, 24
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 181
LDI r11, 54
LDI r12, 78
LDI r13, 111
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
