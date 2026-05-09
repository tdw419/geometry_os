; DESCRIPTION: Composite: Places a yellow 39x104 rectangle at position (443, 19) then Sets a single orange pixel at (107, 111) then Places a black line segment connecting (134, 235) to (336, 223).
; PLAN: r0=443(x), r1=19(y), r2=39(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=111(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=134(x1), r11=235(y1), r12=336(x2), r13=223(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 19
LDI r2, 39
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 111
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 134
LDI r11, 235
LDI r12, 336
LDI r13, 223
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
