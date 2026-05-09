; DESCRIPTION: Composite: Renders a yellow box of size 101x64 starting at (224, 34) then Places a orange line segment connecting (454, 52) to (380, 185).
; PLAN: r0=224(x), r1=34(y), r2=101(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=52(y1), r7=380(x2), r8=185(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 34
LDI r2, 101
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 52
LDI r7, 380
LDI r8, 185
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
