; DESCRIPTION: Composite: Sets a single black pixel at (421, 209) then Renders a white box of size 36x50 starting at (92, 60) then Renders a red line between points (442, 69) and (289, 123).
; PLAN: r0=421(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=60(y), r7=36(width), r8=50(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=442(x1), r11=69(y1), r12=289(x2), r13=123(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 209
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 92
LDI r6, 60
LDI r7, 36
LDI r8, 50
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 69
LDI r12, 289
LDI r13, 123
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
