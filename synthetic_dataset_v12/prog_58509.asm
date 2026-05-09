; DESCRIPTION: Composite: Draws a red rectangle at (284, 56) with width 51 and height 98 then Sets a single cyan pixel at (390, 92).
; PLAN: r0=284(x), r1=56(y), r2=51(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=92(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 284
LDI r1, 56
LDI r2, 51
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 92
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
