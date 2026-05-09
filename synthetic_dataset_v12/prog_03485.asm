; DESCRIPTION: Composite: Renders a cyan disk with center (387, 190) and radius 61 then Renders a magenta box of size 62x35 starting at (129, 217).
; PLAN: r0=387(x), r1=190(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=217(y), r7=62(width), r8=35(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 190
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 217
LDI r7, 62
LDI r8, 35
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
