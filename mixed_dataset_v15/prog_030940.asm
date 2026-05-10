; DESCRIPTION: Composite: Renders a orange disk with center (103, 179) and radius 72 then Renders a yellow box of size 95x85 starting at (251, 52).
; PLAN: r0=103(x), r1=179(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=52(y), r7=95(width), r8=85(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 179
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 52
LDI r7, 95
LDI r8, 85
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
