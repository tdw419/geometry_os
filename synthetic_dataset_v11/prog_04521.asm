; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (5, 100) spanning 61 by 120 pixels. Then Draws a white circle centered at (175, 150) with radius 43.
; PLAN: r0=5(x), r1=100(y), r2=61(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=175(x), r1=150(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a purple rectangular region at (5, 100) spanning 61 by 120 pixels.
; PLAN: r0=5(x), r1=100(y), r2=61(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 100
LDI r2, 61
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (175, 150) with radius 43.
; PLAN: r0=175(x), r1=150(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 150
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
