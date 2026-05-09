; DESCRIPTION: Composite: Sets a single green pixel at (289, 0) then Draws a yellow line from (92, 12) to (308, 0) then Places a magenta circle of radius 14 at center (238, 171).
; PLAN: r0=289(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=92(x1), r6=12(y1), r7=308(x2), r8=0(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=171(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 289
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 92
LDI r6, 12
LDI r7, 308
LDI r8, 0
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 171
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
