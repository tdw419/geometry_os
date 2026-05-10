; DESCRIPTION: Composite: Creates a blue circular shape at (406, 33) with radius 32 then Renders a orange box of size 89x85 starting at (263, 73).
; PLAN: r0=406(x), r1=33(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x), r6=73(y), r7=89(width), r8=85(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 33
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 73
LDI r7, 89
LDI r8, 85
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
