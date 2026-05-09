; DESCRIPTION: Composite: Renders a black box of size 50x30 starting at (176, 174) then Creates a blue circular shape at (401, 116) with radius 56.
; PLAN: r0=176(x), r1=174(y), r2=50(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=116(y), r7=56(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 174
LDI r2, 50
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 116
LDI r7, 56
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
