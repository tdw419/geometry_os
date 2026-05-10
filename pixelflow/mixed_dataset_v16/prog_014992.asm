; DESCRIPTION: Composite: Places a black circle of radius 14 at center (238, 116) then Renders a blue box of size 109x81 starting at (230, 87).
; PLAN: r0=238(x), r1=116(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x), r6=87(y), r7=109(width), r8=81(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 116
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 87
LDI r7, 109
LDI r8, 81
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
