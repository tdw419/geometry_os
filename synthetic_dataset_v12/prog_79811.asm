; DESCRIPTION: Composite: Renders a white disk with center (71, 166) and radius 59 then Places a blue 99x102 rectangle at position (176, 20).
; PLAN: r0=71(x), r1=166(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=20(y), r7=99(width), r8=102(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 166
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 20
LDI r7, 99
LDI r8, 102
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
