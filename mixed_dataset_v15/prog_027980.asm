; DESCRIPTION: Composite: Renders a yellow disk with center (343, 95) and radius 79 then Renders a magenta box of size 68x16 starting at (416, 19).
; PLAN: r0=343(x), r1=95(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=19(y), r7=68(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 95
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 19
LDI r7, 68
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
