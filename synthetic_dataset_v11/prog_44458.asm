; DESCRIPTION: Composite: . Then Places a purple circle of radius 69 at center (104, 140). Then Renders a white box of size 55x12 starting at (33, 152).
; PLAN: r0=104(x), r1=140(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=33(x), r1=152(y), r2=55(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 69 at center (104, 140).
; PLAN: r0=104(x), r1=140(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 140
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white box of size 55x12 starting at (33, 152).
; PLAN: r0=33(x), r1=152(y), r2=55(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 152
LDI r2, 55
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
