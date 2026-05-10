; DESCRIPTION: Composite: Places a red 66x102 rectangle at position (298, 26) then Renders a white disk with center (280, 69) and radius 54.
; PLAN: r0=298(x), r1=26(y), r2=66(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=69(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 298
LDI r1, 26
LDI r2, 66
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 69
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
