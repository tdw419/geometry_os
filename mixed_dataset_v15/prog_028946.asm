; DESCRIPTION: Composite: Renders a orange disk with center (437, 117) and radius 16 then Creates a magenta rectangular region at (382, 35) spanning 71 by 25 pixels.
; PLAN: r0=437(x), r1=117(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=35(y), r7=71(width), r8=25(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 117
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 35
LDI r7, 71
LDI r8, 25
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
