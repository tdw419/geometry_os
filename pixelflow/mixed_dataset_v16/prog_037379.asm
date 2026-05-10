; DESCRIPTION: Composite: Renders a cyan box of size 61x112 starting at (104, 102) then Draws a cyan circle centered at (331, 173) with radius 79.
; PLAN: r0=104(x), r1=102(y), r2=61(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=173(y), r7=79(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 104
LDI r1, 102
LDI r2, 61
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 173
LDI r7, 79
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
