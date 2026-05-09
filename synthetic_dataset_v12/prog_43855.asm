; DESCRIPTION: Composite: Draws a white circle centered at (345, 124) with radius 57 then Renders a green box of size 45x89 starting at (275, 35).
; PLAN: r0=345(x), r1=124(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=35(y), r7=45(width), r8=89(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 124
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 35
LDI r7, 45
LDI r8, 89
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
