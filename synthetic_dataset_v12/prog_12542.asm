; DESCRIPTION: Composite: Places a orange 54x71 rectangle at position (405, 105) then Renders a white disk with center (337, 76) and radius 16.
; PLAN: r0=405(x), r1=105(y), r2=54(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=76(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 405
LDI r1, 105
LDI r2, 54
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 76
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
