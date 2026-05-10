; DESCRIPTION: Composite: Renders a white disk with center (152, 122) and radius 71 then Places a red 52x47 rectangle at position (267, 145).
; PLAN: r0=152(x), r1=122(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=145(y), r7=52(width), r8=47(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 122
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 145
LDI r7, 52
LDI r8, 47
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
