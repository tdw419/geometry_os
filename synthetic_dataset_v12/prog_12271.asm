; DESCRIPTION: Composite: Places a purple dot at position (211, 226) then Places a blue 61x62 rectangle at position (199, 13) then Renders a black disk with center (214, 64) and radius 29.
; PLAN: r0=211(x), r1=226(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=13(y), r7=61(width), r8=62(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=214(x), r11=64(y), r12=29(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 226
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 199
LDI r6, 13
LDI r7, 61
LDI r8, 62
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 64
LDI r12, 29
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
