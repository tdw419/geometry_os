; DESCRIPTION: Composite: Creates a black circular shape at (74, 133) with radius 24 then Renders a orange box of size 98x115 starting at (242, 67).
; PLAN: r0=74(x), r1=133(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x), r6=67(y), r7=98(width), r8=115(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 74
LDI r1, 133
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 67
LDI r7, 98
LDI r8, 115
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
