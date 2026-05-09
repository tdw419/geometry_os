; DESCRIPTION: Composite: . Then Places a black 16x61 rectangle at position (55, 162). Then Draws a white circle centered at (150, 156) with radius 77.
; PLAN: r0=55(x), r1=162(y), r2=16(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=150(x), r1=156(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 16x61 rectangle at position (55, 162).
; PLAN: r0=55(x), r1=162(y), r2=16(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 162
LDI r2, 16
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (150, 156) with radius 77.
; PLAN: r0=150(x), r1=156(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 156
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
