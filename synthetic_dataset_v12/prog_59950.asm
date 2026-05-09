; DESCRIPTION: Composite: Creates a cyan rectangular region at (36, 88) spanning 32 by 76 pixels then Renders a cyan disk with center (260, 180) and radius 67.
; PLAN: r0=36(x), r1=88(y), r2=32(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=180(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 36
LDI r1, 88
LDI r2, 32
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 180
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
