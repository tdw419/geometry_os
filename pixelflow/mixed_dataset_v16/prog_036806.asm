; DESCRIPTION: Composite: Creates a yellow circular shape at (360, 188) with radius 59 then Renders a green box of size 22x40 starting at (199, 154).
; PLAN: r0=360(x), r1=188(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=154(y), r7=22(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 188
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 154
LDI r7, 22
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
