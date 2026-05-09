; DESCRIPTION: Composite: Places a green 111x15 rectangle at position (102, 173) then Sets a single red pixel at (313, 147).
; PLAN: r0=102(x), r1=173(y), r2=111(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=147(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 173
LDI r2, 111
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 147
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
