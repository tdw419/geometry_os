; DESCRIPTION: Composite: Creates a orange circular shape at (482, 126) with radius 25 then Renders a blue box of size 48x68 starting at (124, 32).
; PLAN: r0=482(x), r1=126(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=32(y), r7=48(width), r8=68(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 126
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 32
LDI r7, 48
LDI r8, 68
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
