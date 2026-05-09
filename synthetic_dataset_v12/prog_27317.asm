; DESCRIPTION: Composite: Creates a green circular shape at (380, 137) with radius 48 then Renders a white box of size 97x120 starting at (135, 20).
; PLAN: r0=380(x), r1=137(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=20(y), r7=97(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 137
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 20
LDI r7, 97
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
