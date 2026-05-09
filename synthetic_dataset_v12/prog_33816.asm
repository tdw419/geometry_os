; DESCRIPTION: Composite: Places a magenta circle of radius 25 at center (64, 228) then Places a blue dot at position (208, 88) then Places a black 44x26 rectangle at position (374, 223).
; PLAN: r0=64(x), r1=228(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=88(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=374(x), r11=223(y), r12=44(width), r13=26(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 228
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 88
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 374
LDI r11, 223
LDI r12, 44
LDI r13, 26
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
