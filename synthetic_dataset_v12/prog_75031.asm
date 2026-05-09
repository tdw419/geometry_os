; DESCRIPTION: Composite: Places a blue circle of radius 16 at center (366, 148) then Renders a blue box of size 86x92 starting at (10, 158).
; PLAN: r0=366(x), r1=148(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=158(y), r7=86(width), r8=92(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 148
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 158
LDI r7, 86
LDI r8, 92
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
