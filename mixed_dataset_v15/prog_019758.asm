; DESCRIPTION: Composite: Draws a green circle centered at (424, 73) with radius 46 then Renders a orange box of size 73x64 starting at (419, 33).
; PLAN: r0=424(x), r1=73(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=33(y), r7=73(width), r8=64(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 424
LDI r1, 73
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 33
LDI r7, 73
LDI r8, 64
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
