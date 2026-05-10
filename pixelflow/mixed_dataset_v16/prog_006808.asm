; DESCRIPTION: Composite: Renders a black disk with center (116, 150) and radius 13 then Places a blue dot at position (159, 213) then Places a yellow 10x82 rectangle at position (307, 143).
; PLAN: r0=116(x), r1=150(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=213(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=307(x), r11=143(y), r12=10(width), r13=82(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 150
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 213
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 307
LDI r11, 143
LDI r12, 10
LDI r13, 82
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
