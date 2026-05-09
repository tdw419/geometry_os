; DESCRIPTION: Composite: Places a green circle of radius 69 at center (392, 181) then Places a magenta 24x67 rectangle at position (42, 122).
; PLAN: r0=392(x), r1=181(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=122(y), r7=24(width), r8=67(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 181
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 122
LDI r7, 24
LDI r8, 67
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
