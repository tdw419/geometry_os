; DESCRIPTION: Composite: Renders a blue disk with center (336, 155) and radius 76 then Renders a purple box of size 87x46 starting at (69, 161).
; PLAN: r0=336(x), r1=155(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=161(y), r7=87(width), r8=46(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 155
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 161
LDI r7, 87
LDI r8, 46
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
