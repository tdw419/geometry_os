; DESCRIPTION: Composite: . Then Draws a white circle centered at (154, 19) with radius 16. Then Places a magenta 90x116 rectangle at position (76, 100).
; PLAN: r0=154(x), r1=19(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=76(x), r1=100(y), r2=90(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (154, 19) with radius 16.
; PLAN: r0=154(x), r1=19(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 19
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta 90x116 rectangle at position (76, 100).
; PLAN: r0=76(x), r1=100(y), r2=90(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 100
LDI r2, 90
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
