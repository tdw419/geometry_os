; DESCRIPTION: Composite: Places a green dot at position (15, 0) then Creates a blue circular shape at (398, 117) with radius 43 then Places a black 90x82 rectangle at position (308, 38).
; PLAN: r0=15(x), r1=0(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=398(x), r6=117(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=308(x), r11=38(y), r12=90(width), r13=82(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 0
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 398
LDI r6, 117
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 308
LDI r11, 38
LDI r12, 90
LDI r13, 82
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
