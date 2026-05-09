; DESCRIPTION: Composite: . Then Places a yellow circle of radius 36 at center (117, 75). Then Creates a white rectangular region at (124, 58) spanning 13 by 117 pixels.
; PLAN: r0=117(x), r1=75(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=124(x), r1=58(y), r2=13(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 36 at center (117, 75).
; PLAN: r0=117(x), r1=75(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 75
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (124, 58) spanning 13 by 117 pixels.
; PLAN: r0=124(x), r1=58(y), r2=13(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 58
LDI r2, 13
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
