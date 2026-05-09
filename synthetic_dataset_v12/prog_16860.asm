; DESCRIPTION: Composite: Creates a black circular shape at (211, 208) with radius 48 then Places a blue 30x60 rectangle at position (317, 24).
; PLAN: r0=211(x), r1=208(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=24(y), r7=30(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 208
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 24
LDI r7, 30
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
