; DESCRIPTION: Composite: Renders a red box of size 70x23 starting at (384, 179) then Places a cyan circle of radius 76 at center (148, 79).
; PLAN: r0=384(x), r1=179(y), r2=70(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x), r6=79(y), r7=76(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 384
LDI r1, 179
LDI r2, 70
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 79
LDI r7, 76
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
