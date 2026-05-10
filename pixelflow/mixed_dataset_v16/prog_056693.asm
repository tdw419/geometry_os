; DESCRIPTION: Composite: Renders a magenta box of size 59x85 starting at (443, 4) then Renders a yellow disk with center (126, 121) and radius 45.
; PLAN: r0=443(x), r1=4(y), r2=59(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=121(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 443
LDI r1, 4
LDI r2, 59
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 121
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
