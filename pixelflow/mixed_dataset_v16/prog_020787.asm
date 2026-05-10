; DESCRIPTION: Composite: Renders a blue disk with center (473, 93) and radius 27 then Creates a white rectangular region at (66, 31) spanning 15 by 55 pixels.
; PLAN: r0=473(x), r1=93(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=31(y), r7=15(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 93
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 31
LDI r7, 15
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
