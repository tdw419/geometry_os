; DESCRIPTION: Composite: Renders a yellow box of size 38x100 starting at (279, 46) then Renders a orange disk with center (56, 48) and radius 14.
; PLAN: r0=279(x), r1=46(y), r2=38(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=56(x), r6=48(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 279
LDI r1, 46
LDI r2, 38
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 48
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
