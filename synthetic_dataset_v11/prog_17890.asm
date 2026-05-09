; DESCRIPTION: Composite: . Then Renders a black box of size 40x30 starting at (124, 32). Then Places a white circle of radius 70 at center (142, 135).
; PLAN: r0=124(x), r1=32(y), r2=40(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=142(x), r1=135(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 40x30 starting at (124, 32).
; PLAN: r0=124(x), r1=32(y), r2=40(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 32
LDI r2, 40
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 70 at center (142, 135).
; PLAN: r0=142(x), r1=135(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 135
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
