; DESCRIPTION: Composite: Renders a yellow disk with center (86, 190) and radius 25 then Creates a blue rectangular region at (425, 22) spanning 32 by 44 pixels.
; PLAN: r0=86(x), r1=190(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=22(y), r7=32(width), r8=44(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 190
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 22
LDI r7, 32
LDI r8, 44
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
