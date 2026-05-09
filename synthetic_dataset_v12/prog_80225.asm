; DESCRIPTION: Composite: Places a blue 32x43 rectangle at position (281, 31) then Renders a black disk with center (149, 167) and radius 50.
; PLAN: r0=281(x), r1=31(y), r2=32(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x), r6=167(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 31
LDI r2, 32
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 167
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
