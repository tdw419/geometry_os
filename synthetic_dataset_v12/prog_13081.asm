; DESCRIPTION: Composite: Draws a green line from (499, 60) to (189, 138) then Draws a cyan circle centered at (324, 172) with radius 62.
; PLAN: r0=499(x1), r1=60(y1), r2=189(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=324(x), r6=172(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 499
LDI r1, 60
LDI r2, 189
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 172
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
