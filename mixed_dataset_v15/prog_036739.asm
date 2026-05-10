; DESCRIPTION: Composite: Creates a green circular shape at (80, 139) with radius 33 then Renders a blue box of size 51x90 starting at (80, 23).
; PLAN: r0=80(x), r1=139(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=23(y), r7=51(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 139
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 23
LDI r7, 51
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
