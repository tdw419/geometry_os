; DESCRIPTION: Composite: Renders a cyan disk with center (200, 84) and radius 24 then Creates a blue rectangular region at (85, 127) spanning 28 by 99 pixels.
; PLAN: r0=200(x), r1=84(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=127(y), r7=28(width), r8=99(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 84
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 127
LDI r7, 28
LDI r8, 99
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
