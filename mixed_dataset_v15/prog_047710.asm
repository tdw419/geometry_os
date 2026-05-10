; DESCRIPTION: Composite: Renders a red box of size 48x38 starting at (275, 132) then Creates a green circular shape at (431, 109) with radius 64.
; PLAN: r0=275(x), r1=132(y), r2=48(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=109(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 275
LDI r1, 132
LDI r2, 48
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 109
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
