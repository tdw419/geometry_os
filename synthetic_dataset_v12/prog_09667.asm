; DESCRIPTION: Composite: Draws a yellow circle centered at (300, 82) with radius 61 then Draws a red rectangle at (432, 44) with width 38 and height 33.
; PLAN: r0=300(x), r1=82(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=44(y), r7=38(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 300
LDI r1, 82
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 44
LDI r7, 38
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
