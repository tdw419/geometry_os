; DESCRIPTION: Composite: Renders a black box of size 68x59 starting at (401, 169) then Creates a blue circular shape at (126, 166) with radius 44.
; PLAN: r0=401(x), r1=169(y), r2=68(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=166(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 169
LDI r2, 68
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 166
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
