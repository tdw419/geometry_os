; DESCRIPTION: Composite: . Then Renders a white box of size 112x19 starting at (79, 205). Then Draws a white circle centered at (43, 68) with radius 33.
; PLAN: r0=79(x), r1=205(y), r2=112(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=43(x), r1=68(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 112x19 starting at (79, 205).
; PLAN: r0=79(x), r1=205(y), r2=112(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 205
LDI r2, 112
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (43, 68) with radius 33.
; PLAN: r0=43(x), r1=68(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 68
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
