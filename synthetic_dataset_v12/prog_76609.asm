; DESCRIPTION: Composite: Places a red circle of radius 71 at center (178, 96) then Renders a blue box of size 34x107 starting at (355, 42).
; PLAN: r0=178(x), r1=96(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=42(y), r7=34(width), r8=107(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 96
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 42
LDI r7, 34
LDI r8, 107
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
