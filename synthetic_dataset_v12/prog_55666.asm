; DESCRIPTION: Composite: Renders a yellow disk with center (299, 116) and radius 36 then Places a red 39x46 rectangle at position (100, 85).
; PLAN: r0=299(x), r1=116(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x), r6=85(y), r7=39(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 116
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 85
LDI r7, 39
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
