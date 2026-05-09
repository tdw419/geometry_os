; DESCRIPTION: Composite: . Then Places a red circle of radius 39 at center (191, 173). Then Creates a red rectangular region at (103, 27) spanning 46 by 44 pixels.
; PLAN: r0=191(x), r1=173(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=103(x), r1=27(y), r2=46(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 39 at center (191, 173).
; PLAN: r0=191(x), r1=173(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 173
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (103, 27) spanning 46 by 44 pixels.
; PLAN: r0=103(x), r1=27(y), r2=46(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 27
LDI r2, 46
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
