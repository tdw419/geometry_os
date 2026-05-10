; DESCRIPTION: Composite: Renders a black box of size 120x92 starting at (345, 57) then Creates a blue circular shape at (73, 226) with radius 30.
; PLAN: r0=345(x), r1=57(y), r2=120(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=226(y), r7=30(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 57
LDI r2, 120
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 226
LDI r7, 30
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
