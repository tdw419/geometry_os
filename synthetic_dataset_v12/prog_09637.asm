; DESCRIPTION: Composite: Creates a purple circular shape at (345, 111) with radius 36 then Renders a green box of size 100x96 starting at (174, 40).
; PLAN: r0=345(x), r1=111(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x), r6=40(y), r7=100(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 111
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 40
LDI r7, 100
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
