; DESCRIPTION: Composite: Places a magenta 94x98 rectangle at position (30, 8) then Renders a white disk with center (300, 161) and radius 69.
; PLAN: r0=30(x), r1=8(y), r2=94(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=161(y), r7=69(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 8
LDI r2, 94
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 161
LDI r7, 69
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
