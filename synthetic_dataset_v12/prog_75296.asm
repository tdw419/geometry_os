; DESCRIPTION: Composite: Creates a cyan circular shape at (247, 173) with radius 62 then Draws a orange line from (377, 91) to (154, 234).
; PLAN: r0=247(x), r1=173(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x1), r6=91(y1), r7=154(x2), r8=234(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 173
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 91
LDI r7, 154
LDI r8, 234
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
