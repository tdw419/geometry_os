; DESCRIPTION: Composite: Renders a purple disk with center (355, 131) and radius 73 then Renders a orange box of size 72x86 starting at (249, 116).
; PLAN: r0=355(x), r1=131(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=116(y), r7=72(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 131
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 116
LDI r7, 72
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
