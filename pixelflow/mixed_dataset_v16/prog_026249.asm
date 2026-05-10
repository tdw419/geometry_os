; DESCRIPTION: Composite: Places a white circle of radius 77 at center (168, 126) then Draws a yellow rectangle at (150, 38) with width 69 and height 100.
; PLAN: r0=168(x), r1=126(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=150(x), r6=38(y), r7=69(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 126
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 150
LDI r6, 38
LDI r7, 69
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
