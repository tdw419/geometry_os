; DESCRIPTION: Composite: . Then Draws a white circle centered at (116, 70) with radius 62. Then Places a yellow 102x66 rectangle at position (120, 69).
; PLAN: r0=116(x), r1=70(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=120(x), r1=69(y), r2=102(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (116, 70) with radius 62.
; PLAN: r0=116(x), r1=70(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 70
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 102x66 rectangle at position (120, 69).
; PLAN: r0=120(x), r1=69(y), r2=102(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 69
LDI r2, 102
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
