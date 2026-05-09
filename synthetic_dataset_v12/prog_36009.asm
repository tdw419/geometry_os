; DESCRIPTION: Composite: Renders a purple box of size 32x108 starting at (281, 23) then Renders a red disk with center (66, 106) and radius 66.
; PLAN: r0=281(x), r1=23(y), r2=32(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=106(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 23
LDI r2, 32
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 106
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
