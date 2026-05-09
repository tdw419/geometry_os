; DESCRIPTION: Composite: . Then Renders a white box of size 53x83 starting at (89, 173). Then Draws a red circle centered at (134, 115) with radius 70.
; PLAN: r0=89(x), r1=173(y), r2=53(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=134(x), r1=115(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white box of size 53x83 starting at (89, 173).
; PLAN: r0=89(x), r1=173(y), r2=53(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 173
LDI r2, 53
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red circle centered at (134, 115) with radius 70.
; PLAN: r0=134(x), r1=115(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 115
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
