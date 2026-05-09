; DESCRIPTION: Composite: Renders a yellow disk with center (443, 234) and radius 15 then Renders a magenta box of size 22x11 starting at (361, 84).
; PLAN: r0=443(x), r1=234(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=84(y), r7=22(width), r8=11(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 234
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 84
LDI r7, 22
LDI r8, 11
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
