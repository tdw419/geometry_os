; DESCRIPTION: Composite: Creates a green circular shape at (342, 77) with radius 45 then Renders a magenta box of size 99x47 starting at (36, 89).
; PLAN: r0=342(x), r1=77(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=36(x), r6=89(y), r7=99(width), r8=47(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 77
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 36
LDI r6, 89
LDI r7, 99
LDI r8, 47
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
