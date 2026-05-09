; DESCRIPTION: Composite: . Then Places a yellow 92x116 rectangle at position (91, 109). Then Creates a white circular shape at (70, 113) with radius 51.
; PLAN: r0=91(x), r1=109(y), r2=92(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=70(x), r1=113(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow 92x116 rectangle at position (91, 109).
; PLAN: r0=91(x), r1=109(y), r2=92(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 109
LDI r2, 92
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (70, 113) with radius 51.
; PLAN: r0=70(x), r1=113(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 113
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
