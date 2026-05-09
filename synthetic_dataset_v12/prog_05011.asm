; DESCRIPTION: Composite: Renders a purple box of size 73x28 starting at (294, 91) then Places a red circle of radius 11 at center (217, 197).
; PLAN: r0=294(x), r1=91(y), r2=73(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=197(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 294
LDI r1, 91
LDI r2, 73
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 197
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
