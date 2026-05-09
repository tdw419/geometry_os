; DESCRIPTION: Composite: Places a white 43x71 rectangle at position (324, 78) then Renders a blue disk with center (103, 205) and radius 43.
; PLAN: r0=324(x), r1=78(y), r2=43(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x), r6=205(y), r7=43(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 324
LDI r1, 78
LDI r2, 43
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 205
LDI r7, 43
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
