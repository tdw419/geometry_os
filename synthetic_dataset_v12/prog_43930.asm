; DESCRIPTION: Composite: Renders a white box of size 70x18 starting at (262, 190) then Renders a red disk with center (115, 106) and radius 57.
; PLAN: r0=262(x), r1=190(y), r2=70(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=106(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 190
LDI r2, 70
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 106
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
