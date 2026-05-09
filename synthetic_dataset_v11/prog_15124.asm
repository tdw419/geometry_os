; DESCRIPTION: Composite: . Then Places a white circle of radius 10 at center (51, 48). Then Creates a purple rectangular region at (107, 124) spanning 39 by 45 pixels.
; PLAN: r0=51(x), r1=48(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=107(x), r1=124(y), r2=39(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 10 at center (51, 48).
; PLAN: r0=51(x), r1=48(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 48
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (107, 124) spanning 39 by 45 pixels.
; PLAN: r0=107(x), r1=124(y), r2=39(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 124
LDI r2, 39
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
