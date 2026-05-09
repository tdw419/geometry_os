; DESCRIPTION: Composite: Draws a red rectangle at (48, 75) with width 103 and height 58 then Sets a single red pixel at (1, 59).
; PLAN: r0=48(x), r1=75(y), r2=103(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=59(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 48
LDI r1, 75
LDI r2, 103
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 59
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
