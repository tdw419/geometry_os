; DESCRIPTION: Composite: Creates a cyan circular shape at (406, 140) with radius 25 then Renders a blue box of size 69x44 starting at (73, 179).
; PLAN: r0=406(x), r1=140(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=179(y), r7=69(width), r8=44(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 140
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 179
LDI r7, 69
LDI r8, 44
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
