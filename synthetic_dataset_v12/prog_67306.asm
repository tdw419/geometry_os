; DESCRIPTION: Composite: Creates a red circular shape at (379, 81) with radius 56 then Places a black dot at position (481, 111) then Renders a red box of size 48x75 starting at (308, 75).
; PLAN: r0=379(x), r1=81(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x), r6=111(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=308(x), r11=75(y), r12=48(width), r13=75(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 81
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 111
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 308
LDI r11, 75
LDI r12, 48
LDI r13, 75
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
