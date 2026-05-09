; DESCRIPTION: Composite: Renders a black box of size 92x104 starting at (415, 131) then Sets a single yellow pixel at (284, 173).
; PLAN: r0=415(x), r1=131(y), r2=92(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=173(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 415
LDI r1, 131
LDI r2, 92
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 173
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
