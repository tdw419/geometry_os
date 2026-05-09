; DESCRIPTION: Composite: Renders a red disk with center (392, 177) and radius 18 then Renders a red box of size 46x94 starting at (373, 93).
; PLAN: r0=392(x), r1=177(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=93(y), r7=46(width), r8=94(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 177
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 93
LDI r7, 46
LDI r8, 94
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
