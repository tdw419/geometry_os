; DESCRIPTION: Composite: Creates a blue circular shape at (249, 195) with radius 46 then Renders a red box of size 31x32 starting at (113, 203).
; PLAN: r0=249(x), r1=195(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=113(x), r6=203(y), r7=31(width), r8=32(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 195
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 113
LDI r6, 203
LDI r7, 31
LDI r8, 32
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
