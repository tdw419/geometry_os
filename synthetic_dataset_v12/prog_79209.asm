; DESCRIPTION: Composite: Sets a single white pixel at (340, 5) then Places a red 92x40 rectangle at position (349, 74) then Draws a white line from (421, 184) to (289, 159).
; PLAN: r0=340(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=349(x), r6=74(y), r7=92(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=421(x1), r11=184(y1), r12=289(x2), r13=159(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 5
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 349
LDI r6, 74
LDI r7, 92
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 184
LDI r12, 289
LDI r13, 159
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
