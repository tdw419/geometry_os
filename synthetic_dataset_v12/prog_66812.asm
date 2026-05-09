; DESCRIPTION: Composite: Renders a blue box of size 60x45 starting at (434, 154) then Creates a white circular shape at (260, 129) with radius 39.
; PLAN: r0=434(x), r1=154(y), r2=60(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=129(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 434
LDI r1, 154
LDI r2, 60
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 129
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
