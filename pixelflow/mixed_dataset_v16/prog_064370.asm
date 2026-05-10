; DESCRIPTION: Composite: Draws a blue circle centered at (243, 65) with radius 61 then Places a white 85x118 rectangle at position (54, 81).
; PLAN: r0=243(x), r1=65(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=81(y), r7=85(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 65
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 81
LDI r7, 85
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
