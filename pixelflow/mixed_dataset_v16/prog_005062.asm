; DESCRIPTION: Composite: Renders a cyan disk with center (111, 112) and radius 77 then Renders a black box of size 33x45 starting at (26, 3).
; PLAN: r0=111(x), r1=112(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=3(y), r7=33(width), r8=45(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 112
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 3
LDI r7, 33
LDI r8, 45
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
